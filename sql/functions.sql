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


-- Convert a speed number from text to integer
CREATE OR REPLACE FUNCTION railway_speed_int(value TEXT) RETURNS INTEGER AS $$
DECLARE
  mph_value TEXT;
BEGIN
  IF value ~ '^[0-9]+(\.[0-9]+)?$' THEN
    RETURN value::INTEGER;
  END IF;
  IF value ~ '^[0-9]+(\.[0-9]+)? ?mph$' THEN
    mph_value := substring(value FROM '^[0-9]+(\.[0-9]+)?')::FLOAT;
    RETURN (mph_value * 1.6)::INTEGER;
  END IF;
  RETURN NULL;
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

CREATE OR REPLACE FUNCTION null_to_dash(value INT) RETURNS TEXT AS $$
BEGIN
  IF value IS NULL OR VALUE = 0 THEN
    RETURN '–';
  END IF;
  RETURN value;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION railway_speed_label(speed_arr INTEGER[]) RETURNS TEXT AS $$
BEGIN
  IF speed_arr[3] = 7 THEN
    RETURN NULL;
  END IF;
  IF speed_arr[3] = 4 THEN
    RETURN speed_arr[1]::TEXT;
  END IF;
  IF  speed_arr[3] = 3 THEN
    RETURN null_to_dash(speed_arr[1]) || '/' || null_to_dash(speed_arr[2]);
  END IF;
  IF speed_arr[3] = 2 THEN
    RETURN null_to_dash(speed_arr[2]) || ' (' || null_to_dash(speed_arr[1]) || ')';
  END IF;
  IF speed_arr[3] = 1 THEN
    RETURN null_to_dash(speed_arr[1]) || ' (' || null_to_dash(speed_arr[2]) || ')';
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;


-- Get the speed limit in the primary and secondary dirction
-- Returns an array with 3 integers:
--   * forward speed
--   * backward speed
--   * has primary direction is line direction (1), is opposite direction of line (2), has no primary direction (3), all direction same speed (4), primary direction invalid (5), contradicting speed values (6), no speed information (7)
CREATE OR REPLACE FUNCTION railway_direction_speed_limit(preferred_direction TEXT, speed TEXT, forward_speed TEXT, backward_speed TEXT) RETURNS INTEGER[] AS $$
BEGIN
  IF speed IS NULL AND forward_speed IS NULL AND backward_speed IS NULL THEN
    RETURN ARRAY[NULL, NULL, 7];
  END IF;
  IF speed IS NOT NULL AND forward_speed IS NULL AND backward_speed IS NULL THEN
    RETURN ARRAY[railway_speed_int(speed), railway_speed_int(speed), 4];
  END IF;
  IF speed IS NOT NULL THEN
    RETURN ARRAY[railway_speed_int(speed), railway_speed_int(speed), 6];
  END IF;
  IF preferred_direction = 'forward' THEN
    RETURN ARRAY[railway_speed_int(forward_speed), railway_speed_int(backward_speed), 1];
  END IF;
  IF preferred_direction = 'backward' THEN
    RETURN ARRAY[railway_speed_int(backward_speed), railway_speed_int(forward_speed), 2];
  END IF;
  IF preferred_direction = 'both' OR preferred_direction IS NULL THEN
    RETURN ARRAY[railway_speed_int(forward_speed), railway_speed_int(backward_speed), 3];
  END IF;
  RETURN ARRAY[railway_speed_int(forward_speed), railway_speed_int(backward_speed), 4];
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
