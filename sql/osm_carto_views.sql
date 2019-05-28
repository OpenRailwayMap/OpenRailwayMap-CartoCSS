CREATE OR REPLACE VIEW openrailwaymap_osm_line AS
  SELECT
    osm_id,
    way,
    railway,
    tags->'public_transport' AS public_transport,
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

CREATE OR REPLACE VIEW openrailwaymap_osm_polygon AS
  SELECT
    osm_id,
    way,
    railway,
    tags->'public_transport' AS public_transport,
    name,
    tags AS tags
  FROM planet_osm_polygon;

CREATE OR REPLACE VIEW openrailwaymap_osm_point AS
  SELECT
    osm_id,
    way,
    railway,
    tags->'public_transport' AS public_transport,
    name,
    tags AS tags
  FROM planet_osm_point;
