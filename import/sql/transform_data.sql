-- Yard nodes which are contained in a landuse=railway area, assume the landuse
-- area as yard geometry.
UPDATE stations s
  SET way = l.way
  FROM landuse l
  WHERE ST_Within(s.way, l.way)
    AND feature = 'yard'
    AND GeometryType(s.way) = 'POINT'
    AND s.osm_type = 'N';
