CREATE OR REPLACE FUNCTION railway_no_to_null(value TEXT) RETURNS TEXT AS $$
BEGIN
  IF value = 'no' THEN
    RETURN NULL;
  END IF;
  RETURN value;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION railway_to_float(value TEXT) RETURNS FLOAT AS $$
BEGIN
  IF value ~ '^[0-9.]+$' THEN
    RETURN value::FLOAT;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION railway_to_int(value TEXT) RETURNS INTEGER AS $$
BEGIN
  IF value ~ '^-?[0-9]+$' THEN
    RETURN value::INTEGER;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION railway_get_first_pos(pos_value TEXT) RETURNS TEXT AS $$
DECLARE
  pos_part1 TEXT;
BEGIN
  pos_part1 := substring(pos_value FROM '^(-?[0-9]+(\.[0-9]+)?)(;|$)');
  IF char_length(pos_part1) = 0 THEN
    RETURN NULL;
  END IF;
  RETURN pos_part1;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION railway_pos_round(km_pos TEXT) RETURNS NUMERIC AS $$
DECLARE
  pos_part1 TEXT;
  km_float NUMERIC(8, 3);
  int_part INTEGER;
BEGIN
  pos_part1 := railway_get_first_pos(km_pos);
  IF pos_part1 IS NULL THEN
    RETURN NULL;
  END IF;
  km_float := pos_part1::NUMERIC(8, 3);
  km_float := round(km_float, 1);
  RETURN trunc(km_float, 1);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION railway_pos_decimal(km_pos TEXT) RETURNS CHAR AS $$
DECLARE
  pos_part1 TEXT;
  pos_parts TEXT[];
BEGIN
  IF km_pos LIKE '%,%' THEN
    RETURN 'y';
  END IF; -- a
  pos_part1 := railway_get_first_pos(km_pos);
  IF pos_part1 IS NULL THEN
    RETURN 'x';
  END IF; -- b
  pos_parts := regexp_split_to_array(pos_part1, '\.');
  IF array_length(pos_parts, 1) = 1 THEN
    RETURN '0';
  END IF; -- c
  IF pos_parts[2] SIMILAR TO '^0{0,}$' THEN
    RETURN '0';
  END IF;
  RETURN substring(pos_parts[2] FROM 1 FOR 1);
END;
$$ LANGUAGE plpgsql;

-- Is this speed in imperial miles per hour?
-- Returns 1 for true, 0 for false
CREATE OR REPLACE FUNCTION railway_speed_imperial(value TEXT) RETURNS INTEGER AS $$
BEGIN
  IF value ~ '^[0-9]+(\.[0-9]+)? ?mph$' THEN
    RETURN 1;
  END IF;
  RETURN 0;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION railway_imperial_flags(value1 TEXT, value2 TEXT) RETURNS INTEGER[] AS $$
BEGIN
  RETURN ARRAY[railway_speed_imperial(value1), railway_speed_imperial(value2)];
END;
$$ LANGUAGE plpgsql;


-- Convert a speed number from text to integer and miles to kilometre
CREATE OR REPLACE FUNCTION railway_speed_int(value TEXT) RETURNS INTEGER AS $$
DECLARE
  mph_value TEXT;
BEGIN
  IF value ~ '^[0-9]+(\.[0-9]+)?$' THEN
    RETURN value::INTEGER;
  END IF;
  IF value ~ '^[0-9]+(\.[0-9]+)? ?mph$' THEN
    mph_value := substring(value FROM '^([0-9]+(\.[0-9]+)?)')::FLOAT;
    RETURN (mph_value::FLOAT * 1.609344)::INTEGER;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Convert a speed number from text to integer but not convert units
CREATE OR REPLACE FUNCTION railway_speed_int_noconvert(value TEXT) RETURNS INTEGER AS $$
DECLARE
  mph_value TEXT;
BEGIN
  -- Casting to numeric first, then to integer in order to avoid
  -- errors when trying to convert non-integer input values (e.g. '9.5 mph')
  IF value ~ '^[0-9]+(\.[0-9]+)?$' THEN
    RETURN value::NUMERIC::INTEGER;
  END IF;
  IF value ~ '^[0-9]+(\.[0-9]+)? ?mph$' THEN
    RETURN substring(value FROM '^([0-9]+(\.[0-9]+)?)')::NUMERIC::INTEGER;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;


-- Get the largest speed from a list of speed values (common at light speed signals)
CREATE OR REPLACE FUNCTION railway_largest_speed_noconvert(value TEXT) RETURNS INTEGER AS $$
DECLARE
  parts TEXT[];
  elem TEXT;
  largest_value INTEGER := NULL;
  this_value INTEGER;
BEGIN
  IF value IS NULL OR value = '' THEN
    RETURN NULL;
  END IF;
  parts := regexp_split_to_array(value, ';');
  FOREACH elem IN ARRAY parts
  LOOP
    IF elem = '' THEN
      CONTINUE;
    END IF;
    this_value := railway_speed_int_noconvert(elem);
    IF largest_value IS NULL OR largest_value < this_value THEN
      largest_value := this_value;
    END IF;
  END LOOP;
  RETURN largest_value;
END;
$$ LANGUAGE plpgsql;

-- Get dominant speed for coloring
CREATE OR REPLACE FUNCTION railway_dominant_speed(preferred_direction TEXT, speed TEXT, forward_speed TEXT, backward_speed TEXT) RETURNS INTEGER AS $$
BEGIN
  IF speed IS NOT NULL AND (forward_speed IS NOT NULL OR backward_speed IS NOT NULL) THEN
    RETURN NULL;
  END IF;
  IF speed IS NOT NULL THEN
    RETURN railway_speed_int(speed);
  END IF;
  IF preferred_direction = 'forward' THEN
    RETURN COALESCE(railway_speed_int(forward_speed), railway_speed_int(speed));
  END IF;
  IF preferred_direction = 'backward' THEN
    RETURN COALESCE(railway_speed_int(backward_speed), railway_speed_int(speed));
  END IF;
  RETURN railway_speed_int(forward_speed);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION null_to_dash(value TEXT) RETURNS TEXT AS $$
BEGIN
  IF value IS NULL OR VALUE = '' THEN
    RETURN '–';
  END IF;
  RETURN value;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION railway_add_unit_to_label(speed INTEGER, is_imp_flag INTEGER) RETURNS TEXT AS $$
BEGIN
  -- note: NULL || TEXT returns NULL
  IF is_imp_flag = 1 THEN
    RETURN speed::TEXT || ' mph';
  END IF;
  RETURN speed::TEXT;
END;
$$ LANGUAGE plpgsql;

DO $$ BEGIN
  CREATE TYPE direction_speeds AS (
    forward INTEGER,
    backward INTEGER,
  -- If the primary direction is the direction of the linestring: 1
  -- Is opposite direction of line: (2)
  -- Has no primary direction: (3)
  -- All direction same speed: (4)
  -- Primary direction invalid: (5)
  -- Contradicting speed values: (6)
  -- No speed information: (7)
    primary_direction INTEGER,
    -- forward_unit, backward_unit: kph (0), mph (1)
    forward_unit INTEGER,
    backward_unit INTEGER
  );
EXCEPTION
  WHEN duplicate_object THEN NULL;
END $$;

CREATE OR REPLACE FUNCTION railway_speed_label(speed_info direction_speeds) RETURNS TEXT AS $$
BEGIN
  IF speed_info.primary_direction = 7 THEN
    RETURN NULL;
  END IF;
  IF speed_info.primary_direction = 4 THEN
    RETURN railway_add_unit_to_label(speed_info.forward, speed_info.forward_unit);
  END IF;
  IF  speed_info.primary_direction = 3 THEN
    RETURN null_to_dash(railway_add_unit_to_label(speed_info.forward, speed_info.forward_unit)) || '/' || null_to_dash(railway_add_unit_to_label(speed_info.backward, speed_info.backward_unit));
  END IF;
  IF speed_info.primary_direction = 2 THEN
    RETURN null_to_dash(railway_add_unit_to_label(speed_info.backward, speed_info.backward_unit)) || ' (' || null_to_dash(railway_add_unit_to_label(speed_info.forward, speed_info.forward_unit)) || ')';
  END IF;
  IF speed_info.primary_direction = 1 THEN
    RETURN null_to_dash(railway_add_unit_to_label(speed_info.forward, speed_info.forward_unit)) || ' (' || null_to_dash(railway_add_unit_to_label(speed_info.backward, speed_info.backward_unit)) || ')';
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;


-- Add flags indicating imperial units to an array of speeds
CREATE OR REPLACE FUNCTION railway_speed_array_add_unit(arr INTEGER[]) RETURNS INTEGER[] AS $$
BEGIN
  RETURN arr || railway_speed_array_add_unit(arr[1]) || railway_speed_array_add_unit(2);
END;
$$ LANGUAGE plpgsql;

-- Get the speed limit in the primary and secondary dirction.
-- No unit conversion is preformed.
-- Returns an array with 3 integers:
--   * forward speed
--   * backward speed
--   * has primary direction is line direction (1), is opposite direction of line (2), has no primary direction (3), all direction same speed (4), primary direction invalid (5), contradicting speed values (6), no speed information (7)
--   * forward unit: kph (0), mph (1)
--   * backward unit: kph (0), mph (1)
CREATE OR REPLACE FUNCTION railway_direction_speed_limit(preferred_direction TEXT, speed TEXT, forward_speed TEXT, backward_speed TEXT) RETURNS direction_speeds AS $$
BEGIN
  IF speed IS NULL AND forward_speed IS NULL AND backward_speed IS NULL THEN
    RETURN (NULL::INTEGER, NULL::INTEGER, 7, 0, 0);
  END IF;
  IF speed IS NOT NULL AND forward_speed IS NULL AND backward_speed IS NULL THEN
    RETURN (railway_speed_int_noconvert(speed), railway_speed_int_noconvert(speed), 4, railway_speed_imperial(speed), railway_speed_imperial(speed));
  END IF;
  IF speed IS NOT NULL THEN
    RETURN (railway_speed_int_noconvert(speed), railway_speed_int_noconvert(speed), 6, railway_speed_imperial(speed), railway_speed_imperial(speed));
  END IF;
  IF preferred_direction = 'forward' THEN
    RETURN (railway_speed_int_noconvert(forward_speed), railway_speed_int_noconvert(backward_speed), 1, railway_speed_imperial(forward_speed), railway_speed_imperial(backward_speed));
  END IF;
  IF preferred_direction = 'backward' THEN
    RETURN (railway_speed_int_noconvert(backward_speed), railway_speed_int_noconvert(forward_speed), 2, railway_speed_imperial(backward_speed), railway_speed_imperial(forward_speed));
  END IF;
  IF preferred_direction = 'both' OR preferred_direction IS NULL THEN
    RETURN (railway_speed_int_noconvert(forward_speed), railway_speed_int_noconvert(backward_speed), 3, railway_speed_imperial(forward_speed), railway_speed_imperial(backward_speed));
  END IF;
  RETURN (railway_speed_int_noconvert(forward_speed), railway_speed_int_noconvert(backward_speed), 4, railway_speed_imperial(forward_speed), railway_speed_imperial(backward_speed));
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION merc_dist_to_earth_dist(y_avg FLOAT, dist FLOAT) RETURNS FLOAT AS $$
DECLARE
  lat_radians FLOAT;
  scale FLOAT;
BEGIN
  lat_radians := 2 * atan(exp(y_avg / 6378137)) - 0.5 * pi();
  scale := 1 / cos(lat_radians);
  RETURN dist / scale;
END;
$$ LANGUAGE plpgsql;


-- Check whether a key is present in a hstore field and if its value is not 'no'
CREATE OR REPLACE FUNCTION railway_has_key(tags HSTORE, key TEXT) RETURNS BOOLEAN AS $$
DECLARE
  value TEXT;
BEGIN
  value := tags->key;
  IF value IS NULL THEN
    RETURN FALSE;
  END IF;
  IF value = 'no' THEN
    RETURN FALSE;
  END IF;
  RETURN TRUE;
END;
$$ LANGUAGE plpgsql;


-- Set a value to 'no' if it is null.
CREATE OR REPLACE FUNCTION railway_null_to_no(field TEXT) RETURNS
TEXT AS $$
BEGIN
  RETURN COALESCE(field, 'no');
END;
$$ LANGUAGE plpgsql;


-- Set a value to 'no' if it is null or 0.
CREATE OR REPLACE FUNCTION railway_null_or_zero_to_no(field TEXT) RETURNS
TEXT AS $$
BEGIN
  IF field = '0' THEN
    RETURN 'no';
  END IF;
  RETURN COALESCE(field, 'no');
END;
$$ LANGUAGE plpgsql;


-- Get which train protection system has to be rendered.
-- Overlaps are not foreseen but the logic could be handled here.
CREATE OR REPLACE FUNCTION railway_train_protection_rendered(
  train_protection TEXT,
  pzb TEXT,
  lzb TEXT,
  atb TEXT,
  atb_eg TEXT,
  atb_ng TEXT,
  atb_vv TEXT,
  atc TEXT,
  kvb TEXT,
  tvm TEXT,
  asfa TEXT,
  ptc TEXT,
  zsi127 TEXT,
  etcs TEXT,
  construction_etcs TEXT) RETURNS TEXT AS $$
BEGIN
  /* Continental systems. They are not supposed to overlap any soon. */
  IF etcs <> 'no' THEN
    RETURN 'etcs';
  END IF;
  IF POSITION('CTCS' IN train_protection) > 0 THEN
    RETURN 'ctcs';
  END IF;
  IF ptc <> 'no' THEN
    RETURN 'ptc';
  END IF;
  IF construction_etcs <> 'no' THEN
    RETURN 'etcs_construction';
  END IF;
  /* National systems. Possible overlaps, the order here decides priority. */
  IF POSITION('SCMT' IN train_protection) > 0 THEN
    RETURN 'scmt';
  END IF;
  IF POSITION('TVM' IN train_protection) > 0 THEN
    RETURN 'tvm';
  END IF; 
  IF tvm = 'yes' OR tvm = '430' OR tvm = '300' THEN
    RETURN 'tvm';
  END IF;
  IF asfa = 'yes' THEN
    RETURN 'asfa';
  END IF;
  IF kvb = 'yes' THEN
    RETURN 'kvb';
  END IF;
  IF atc = 'yes' THEN
    RETURN 'atc';
  END IF;
  IF COALESCE(atb, atb_eg, atb_ng, atb_vv) = 'yes' THEN
    RETURN 'atb';
  END IF;
  IF lzb = 'yes' THEN
    RETURN 'lzb';
  END IF;
  IF pzb = 'yes' THEN
    RETURN 'pzb';
  END IF;
  /* Regional systems. */
  IF zsi127 = 'yes' THEN
    RETURN 'zsi127';
  END IF;
  /* No system. */
  IF train_protection = 'none' THEN
    RETURN 'none';
  END IF;
  IF (pzb = 'no' AND lzb = 'no' AND etcs = 'no') OR (atb = 'no' AND etcs = 'no') OR (atc = 'no' AND etcs = 'no') OR (asfa = 'no' AND etcs = 'no') OR (kvb = 'no' AND tvm = 'no' AND etcs = 'no') OR (zsi127 = 'no') THEN
    RETURN 'none';
  END IF;
  /* No information. */
  RETURN 'unknown';
END;
$$ LANGUAGE plpgsql;


-- Get name for labelling in standard style depending whether it is a bridge, a tunnel or none of these two.
CREATE OR REPLACE FUNCTION railway_label_name(name TEXT, tags HSTORE, tunnel TEXT, bridge TEXT) RETURNS TEXT AS $$
BEGIN
  IF tunnel IS NOT NULL AND tunnel != 'no' THEN
    RETURN COALESCE(tags->'tunnel:name', name);
  END IF;
  IF bridge IS NOT NULL AND bridge != 'no' THEN
    RETURN COALESCE(tags->'bridge:name', name);
  END IF;
  RETURN name;
END;
$$ LANGUAGE plpgsql;

-- Get state of electrification
CREATE OR REPLACE FUNCTION railway_electrification_state(railway TEXT, electrified TEXT,
  deelectrified TEXT, abandoned_electrified TEXT, construction_electrified TEXT,
  proposed_electrified TEXT, ignore_future_states BOOLEAN) RETURNS TEXT AS $$
DECLARE
  state TEXT;
  valid_values TEXT[] := ARRAY['contact_line', 'yes', 'rail', 'ground-level_power_supply', '4th_rail', 'contact_line;rail', 'rail;contact_line'];
BEGIN
  state := NULL;
  IF electrified = ANY(valid_values) THEN
    return 'present';
  END IF;
  IF electrified = 'no' THEN
    state := 'no';
  END IF;
  IF NOT ignore_future_states AND construction_electrified = ANY(valid_values) THEN
    RETURN 'construction';
  END IF;
  IF NOT ignore_future_states AND proposed_electrified = ANY(valid_values) THEN
    RETURN 'proposed';
  END IF;
  IF state = 'no' AND deelectrified = ANY(valid_values) THEN
    RETURN 'deelectrified';
  END IF;
  IF state = 'no' AND abandoned_electrified = ANY(valid_values) THEN
    RETURN 'abandoned';
  END IF;
  RETURN state;
END;
$$ LANGUAGE plpgsql;

-- Get voltage for given state
CREATE OR REPLACE FUNCTION railway_voltage_for_state(state TEXT, voltage TEXT, construction_voltage TEXT, proposed_voltage TEXT) RETURNS INTEGER AS $$
BEGIN
  IF state = 'present' THEN
    RETURN railway_to_int(voltage);
  END IF;
  IF state = 'construction' THEN
    RETURN railway_to_int(construction_voltage);
  END IF;
  IF state = 'proposed' THEN
    RETURN railway_to_int(proposed_voltage);
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Get frequency for given state
CREATE OR REPLACE FUNCTION railway_frequency_for_state(state TEXT, frequency TEXT, construction_frequency TEXT, proposed_frequency TEXT) RETURNS FLOAT AS $$
BEGIN
  IF state = 'present' THEN
    RETURN railway_to_float(frequency);
  END IF;
  IF state = 'construction' THEN
    RETURN railway_to_float(construction_frequency);
  END IF;
  IF state = 'proposed' THEN
    RETURN railway_to_float(proposed_frequency);
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Get label for electrification
CREATE OR REPLACE FUNCTION railway_electrification_label(electrified TEXT, deelectrified TEXT,
    construction_electrified TEXT, proposed_electrified TEXT, voltage TEXT, frequency TEXT,
    construction_voltage TEXT, construction_frequency TEXT, proposed_voltage TEXT,
    proposed_frequency TEXT) RETURNS TEXT AS $$
DECLARE
  volt TEXT;
  freq TEXT;
  volt_int INTEGER;
  kilovolt NUMERIC(3, 1);
  volt_text TEXT;
  freq_text TEXT;
BEGIN
  -- Select right values for voltage and frequency part of the label
  IF railway_no_to_null(electrified) IS NOT NULL OR railway_no_to_null(deelectrified) IS NOT NULL THEN
    volt := voltage;
    freq := frequency;
  ELSIF railway_no_to_null(construction_electrified) IS NOT NULL THEN
    volt := construction_voltage;
    freq := construction_frequency;
  ELSIF railway_no_to_null(proposed_electrified) IS NOT NULL THEN
    volt := proposed_voltage;
    freq := proposed_frequency;
  ELSE
    RETURN NULL;
  END IF;
  -- Grounded sections
  IF volt = '0' THEN
    RETURN '0V';
  END IF;
  -- Round voltage nicely
  volt_int := railway_to_int(volt);
  IF volt_int < 1000 THEN
    volt_text := volt || 'V';
  ELSIF volt_int % 1000 = 0 THEN
    volt_text := (volt_int/1000)::TEXT || 'kV';
  ELSIF volt_int < 100000 THEN
    -- Catch numeric overflow (250001 will trigger it but 250000 not). Values equal or larger than 100 kV are not realistic.
    volt_text := (volt_int::FLOAT / 1000::FLOAT)::NUMERIC(3, 1)::TEXT || 'kV';
  ELSE
    RETURN NULL;
  END IF;
  -- Output voltage and frequency
  IF freq = '0' THEN
    RETURN volt_text || ' =';
  END IF;
  IF freq IS NOT NULL THEN
    RETURN volt_text || ' ' || freq || 'Hz';
  END IF;
  RETURN volt_text;
END;
$$ LANGUAGE plpgsql;

-- Get label for gauge
CREATE OR REPLACE FUNCTION railway_gauge_label(gauge TEXT) RETURNS TEXT AS $$
BEGIN
  IF gauge IS NOT NULL AND gauge ~ '^[0-9;]+$' THEN
    RETURN regexp_replace(gauge, ';', ' | ', 'g');
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Get the desired value from listed values (e.g. gauge)
CREATE OR REPLACE FUNCTION railway_desired_value_from_list(desired_nr INTEGER, listed_values TEXT) RETURNS TEXT AS $$
DECLARE
  value_array TEXT[];
BEGIN
  IF listed_values IS NULL OR listed_values = '' OR desired_nr <= 0 THEN
    RETURN NULL;
  END IF;
  value_array := regexp_split_to_array(listed_values, ';');
  IF desired_nr > array_length(value_array, 1) THEN
    RETURN NULL;
  END IF;
  RETURN value_array[desired_nr];
END;
$$ LANGUAGE plpgsql;
