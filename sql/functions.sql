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
