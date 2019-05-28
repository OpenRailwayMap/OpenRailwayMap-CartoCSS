DROP VIEW IF EXISTS openrailwaymap_osm_line;
CREATE VIEW openrailwaymap_osm_line AS
  SELECT
    way,
    railway,
    tags->'usage' AS usage,
    service,
    construction,
    tunnel,
    bridge,
    ref,
    name,
    z_order,
    tags
  FROM planet_osm_line;

DROP VIEW IF EXISTS openrailwaymap_osm_point;
CREATE VIEW openrailwaymap_osm_point AS
  SELECT
    way,
    railway,
    name,
    tags AS tags
  FROM planet_osm_point;
