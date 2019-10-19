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
    (tags->'maxspeed')::int AS maxspeed,
    tags->'maxspeed:forward' AS maxspeed_forward,
    tags->'maxspeed:backward' AS maxspeed_backward,
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
    tags->'railway:position' AS "railway_position",
    tags->'railway:position:detail' AS "railway_position_detail",
    man_made,
    tags->'public_transport' AS public_transport,
    name,
    tags AS tags
  FROM planet_osm_point;
