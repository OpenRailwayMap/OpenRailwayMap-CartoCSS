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
    tags->'maxspeed' AS maxspeed,
    tags->'maxspeed:forward' AS maxspeed_forward,
    tags->'maxspeed:backward' AS maxspeed_backward,
    tags->'railway:preferred_direction' AS preferred_direction,
    tags->'electrified' AS electrified,
    tags->'frequency' AS frequency,
    tags->'voltage' AS voltage,
    tags->'construction:electrified' AS construction_electrified,
    tags->'construction:frequency' AS construction_frequency,
    tags->'construction:voltage' AS construction_voltage,
    tags->'proposed:electrified' AS proposed_electrified,
    tags->'proposed:frequency' AS proposed_frequency,
    tags->'proposed:voltage' AS proposed_voltage,
    tags->'deelectrified' AS deelectrified,
    tags->'abandoned:electrified' AS abandoned_electrified,
    ref,
    name,
    layer,
    tags
  FROM planet_osm_line;

CREATE OR REPLACE VIEW openrailwaymap_osm_polygon AS
  SELECT
    osm_id,
    way,
    railway,
    tags->'public_transport' AS public_transport,
    name,
    tags AS tags,
    way_area
  FROM planet_osm_polygon;

CREATE OR REPLACE VIEW openrailwaymap_osm_point AS
  SELECT
    osm_id,
    way,
    railway,
    ref,
    tags->'railway:position' AS "railway_position",
    tags->'railway:position:detail' AS "railway_position_detail",
    man_made,
    tags->'public_transport' AS public_transport,
    name,
    tags->'railway:signal:direction'   AS "signal_direction",
    tags->'railway:signal:speed_limit'       AS "signal_speed_limit",
    tags->'railway:signal:speed_limit:form'  AS "signal_speed_limit_form",
    tags->'railway:signal:speed_limit:speed' AS "signal_speed_limit_speed",
    tags->'railway:signal:speed_limit_distant'       AS "signal_speed_limit_distant",
    tags->'railway:signal:speed_limit_distant:form'  AS "signal_speed_limit_distant_form",
    tags->'railway:signal:speed_limit_distant:speed' AS "signal_speed_limit_distant_speed",
    tags->'railway:local_operated' AS railway_local_operated,
    tags AS tags
  FROM planet_osm_point;

CREATE OR REPLACE VIEW openrailwaymap_osm_signals AS
  SELECT
    osm_id,
    way,
    railway,
    ref,
    string_to_array(ref, ' ') AS ref_multiline,
    tags->'railway:signal:direction'   AS "signal_direction",
    tags AS tags
  FROM planet_osm_point;

CREATE OR REPLACE VIEW railway_line_casing AS
  SELECT
    way, railway, usage, service,
    disused, construction,
    disused_railway,
    construction_railway,
    CASE WHEN railway = 'rail' AND usage IN ('tourism', 'military', 'test') AND service IS NULL THEN 400
          WHEN railway = 'rail' AND usage IS NULL AND service IS NULL THEN 400
          WHEN railway = 'rail' AND usage IS NULL AND service = 'siding' THEN 870
          WHEN railway = 'rail' AND usage IS NULL AND service = 'yard' THEN 860
          WHEN railway = 'rail' AND usage IS NULL AND service = 'spur' THEN 880
          WHEN railway = 'rail' AND usage IS NULL AND service = 'crossover' THEN 300
          WHEN railway = 'rail' AND usage = 'main' AND service IS NULL THEN 1100
          WHEN railway = 'rail' AND usage = 'branch' AND service IS NULL THEN 1000
          WHEN railway = 'rail' AND usage = 'industrial' AND service IS NULL THEN 850
          WHEN railway = 'rail' AND usage = 'industrial' AND service IN ('siding', 'spur', 'yard', 'crossover') THEN 850
          WHEN railway IN ('preserved', 'construction') THEN 400
          WHEN railway = 'disused' THEN 300
          ELSE 50
    END AS rank
  FROM
    (SELECT
        way, railway, usage, service,
        tags->'disused' AS disused, construction,
        tags->'disused:railway' AS disused_railway,
        tags->'construction:railway' AS construction_railway,
        layer
      FROM openrailwaymap_osm_line
      WHERE railway IN ('rail', 'tram', 'light_rail', 'subway', 'narrow_gauge', 'disused', 'construction')
    ) AS r
  ORDER by layer, rank NULLS LAST;

CREATE OR REPLACE VIEW railway_line_low AS
  SELECT
    way, railway, usage,
    NULL AS service,
    NULL AS disused, NULL AS construction,
    NULL AS disused_railway,
    NULL AS construction_railway,
    NULL AS disused_usage, NULL AS disused_service,
    NULL AS construction_usage, NULL AS construction_service,
    NULL AS preserved_railway, NULL AS preserved_service,
    NULL AS preserved_usage,
    pzb, lzb, zsi127, atb, atb_eg, atb_ng, atb_vv, atc, kvb, tvm, scmt, asfa, ptc, etcs, construction_etcs,
    railway_train_protection_rank(pzb, lzb, atb, atb_eg, atb_ng, atb_vv, atc, kvb, tvm, scmt, asfa, ptc, zsi127, etcs, construction_etcs) AS rank
  FROM
    (SELECT
        way, railway, usage,
        tags->'railway:pzb' AS pzb,
        railway_null_to_no(tags->'railway:lzb') AS lzb,
        tags->'railway:zsi127' as zsi127,
        tags->'railway:atb' AS atb,
        tags->'railway:atb-eg' AS atb_eg,
        tags->'railway:atb-ng' AS atb_ng,
        tags->'railway:atb-vv' AS atb_vv,
        tags->'railway:atc' AS atc,
        tags->'railway:kvb' AS kvb,
        tags->'railway:tvm' AS tvm,
        tags->'railway:scmt' AS scmt,
        tags->'railway:asfa' AS asfa,
        railway_null_or_zero_to_no(tags->'railway:ptc') AS ptc,
        railway_null_or_zero_to_no(tags->'railway:etcs') AS etcs,
        railway_null_or_zero_to_no(tags->'construction:railway:etcs') AS construction_etcs
      FROM openrailwaymap_osm_line
      WHERE railway = 'rail' AND usage IN ('main', 'branch') AND service IS NULL
    ) AS r
  ORDER BY
    rank NULLS LAST;

CREATE OR REPLACE VIEW railway_line_med AS
  SELECT
    way, railway, usage,
    NULL AS service,
    NULL AS disused, NULL AS construction,
    NULL AS disused_railway,
    NULL AS construction_railway,
    NULL AS disused_usage, NULL AS disused_service,
    NULL AS construction_usage, NULL AS construction_service,
    NULL AS preserved_railway, NULL AS preserved_service,
    NULL AS preserved_usage,
    pzb, lzb, zsi127, atb, atb_eg, atb_ng, atb_vv, atc, kvb, tvm, scmt, asfa, ptc, etcs, construction_etcs,
    railway_train_protection_rank(pzb, lzb, atb, atb_eg, atb_ng, atb_vv, atc, kvb, tvm, scmt, asfa, ptc, zsi127, etcs, construction_etcs) AS rank
  FROM
    (SELECT
        way, railway, usage,
        tags->'railway:pzb' AS pzb,
        railway_null_to_no(tags->'railway:lzb') AS lzb,
        tags->'railway:zsi127' AS zsi127,
        tags->'railway:atb' AS atb,
        tags->'railway:atb-eg' AS atb_eg,
        tags->'railway:atb-ng' AS atb_ng,
        tags->'railway:atb-vv' AS atb_vv,
        tags->'railway:atc' AS atc,
        tags->'railway:kvb' AS kvb,
        tags->'railway:tvm' AS tvm,
        tags->'railway:scmt' AS scmt,
        tags->'railway:asfa' AS asfa,
        railway_null_or_zero_to_no(tags->'railway:ptc') AS ptc,
        railway_null_or_zero_to_no(tags->'railway:etcs') AS etcs,
        railway_null_or_zero_to_no(tags->'construction:railway:etcs') AS construction_etcs
      FROM openrailwaymap_osm_line
      WHERE railway = 'rail' AND usage = 'main' AND service IS NULL
    ) AS r
  ORDER BY
    rank NULLS LAST;

CREATE OR REPLACE VIEW railway_line_fill AS
  SELECT
    way, railway, usage, service,
    disused, construction,
    disused_railway,
    construction_railway,
    disused_usage, disused_service,
    construction_usage, construction_service,
    preserved_railway, preserved_service,
    preserved_usage,
    pzb, lzb, zsi127, atb, atb_eg, atb_ng, atb_vv, atc, kvb, tvm, scmt, asfa, ptc, etcs, construction_etcs,
    railway_train_protection_rank(pzb, lzb, atb, atb_eg, atb_ng, atb_vv, atc, kvb, tvm, scmt, asfa, ptc, zsi127, etcs, construction_etcs) AS rank
  FROM
    (SELECT
        way, railway, usage, service,
        tags->'disused' AS disused, construction,
        tags->'disused:railway' AS disused_railway,
        tags->'construction:railway' AS construction_railway,
        tags->'disused:usage' AS disused_usage, tags->'disused:service' AS disused_service,
        tags->'construction:usage' AS construction_usage, tags->'construction:service' AS construction_service,
        tags->'preserved:railway' AS preserved_railway, tags->'preserved:service' AS preserved_service,
        tags->'preserved:usage' AS preserved_usage,
        tags->'railway:pzb' AS pzb,
        railway_null_to_no(tags->'railway:lzb') AS lzb,
        tags->'railway:zsi127' AS zsi127,
        tags->'railway:atb' AS atb,
        tags->'railway:atb-eg' AS atb_eg,
        tags->'railway:atb-ng' AS atb_ng,
        tags->'railway:atb-vv' AS atb_vv,
        tags->'railway:atc' AS atc,
        tags->'railway:kvb' AS kvb,
        tags->'railway:tvm' AS tvm,
        tags->'railway:scmt' AS scmt,
        tags->'railway:asfa' AS asfa,
        railway_null_or_zero_to_no(tags->'railway:ptc') AS ptc,
        railway_null_or_zero_to_no(tags->'railway:etcs') AS etcs,
        railway_null_or_zero_to_no(tags->'construction:railway:etcs') AS construction_etcs,
        layer
      FROM openrailwaymap_osm_line
      WHERE railway IN ('rail', 'tram', 'light_rail', 'subway', 'narrow_gauge', 'disused', 'construction', 'preserved')
    ) AS r
  ORDER BY
    layer,
    rank NULLS LAST;

CREATE OR REPLACE VIEW signal_boxes_point AS
  SELECT
    way
  FROM (
    SELECT
        way
      FROM openrailwaymap_osm_point
      WHERE railway = 'signal_box'
--     UNION ALL
--     -- include small signal box polygons as well
--     SELECT
--         ST_PointOnSurface(way) AS way
--       FROM openrailwaymap_osm_polygon
--       WHERE
--         railway = 'signal_box'
--         AND way_area/NULLIF(POW(!scale_denominator!*0.001*0.28,2),0) < 24::real
  ) AS boxes;

CREATE OR REPLACE VIEW signal_boxes_polygon AS
  SELECT
    way
  FROM openrailwaymap_osm_polygon
  WHERE
    railway = 'signal_box'
    --AND way_area/NULLIF(POW(!scale_denominator!*0.001*0.28,2),0) >= 24
;

CREATE OR REPLACE VIEW railway_signals AS
  SELECT
    way,
    railway,
    ref,
    array_to_string(ref_multiline, E'\n') AS ref_multiline,
    array_length(ref_multiline, 1) AS height,
    (
      SELECT MAX(char_length(ref_ml))
        FROM unnest(ref_multiline) AS u(ref_ml)
    ) AS width,
    COALESCE(
      tags->'railway:signal:combined',
      tags->'railway:signal:main',
      tags->'railway:signal:distant',
      tags->'railway:signal:train_protection',
      tags->'railway:signal:main_repeated',
      tags->'railway:signal:minor',
      tags->'railway:signal:passing',
      tags->'railway:signal:shunting',
      tags->'railway:signal:stop',
      tags->'railway:signal:stop_demand',
      tags->'railway:signal:station_distant',
      tags->'railway:signal:crossing_distant',
      tags->'railway:signal:crossing',
      tags->'railway:signal:ring',
      tags->'railway:signal:whistle',
      tags->'railway:signal:departure',
      tags->'railway:signal:main_repeated',
      tags->'railway:signal:humping',
      tags->'railway:signal:speed_limit'
    ) AS feature,
    COALESCE(
      tags->'railway:signal:combined:deactivated',
      tags->'railway:signal:main:deactivated',
      tags->'railway:signal:distant:deactivated',
      tags->'railway:signal:train_protection:deactivated',
      tags->'railway:signal:main_repeated:deactivated',
      tags->'railway:signal:minor:deactivated',
      tags->'railway:signal:passing:deactivated',
      tags->'railway:signal:shunting:deactivated',
      tags->'railway:signal:stop:deactivated',
      tags->'railway:signal:stop_demand:deactivated',
      tags->'railway:signal:station_distant:deactivated',
      tags->'railway:signal:crossing_distant:deactivated',
      tags->'railway:signal:crossing:deactivated',
      tags->'railway:signal:ring:deactivated',
      tags->'railway:signal:whistle:deactivated',
      tags->'railway:signal:departure:deactivated',
      tags->'railway:signal:main_repeated:deactivated',
      tags->'railway:signal:humping:deactivated',
      tags->'railway:signal:speed_limit:deactivated'
    ) AS deactivated,
    tags->'railway:signal:passing:caption' AS passing_caption,
    tags->'railway:signal:stop:caption' AS stop_caption,
    tags->'railway:signal:combined:deactivated' AS combined_deactivated,
    tags->'railway:signal:main:deactivated' AS main_deactivated,
    tags->'railway:signal:distant:deactivated' AS distant_deactivated,
    tags->'railway:signal:train_protection:deactivated' AS train_protection_deactivated,
    tags->'railway:signal:main_repeated:deactivated' AS main_repeated_deactivated,
    tags->'railway:signal:wrong_road' AS wrong_road,
    tags->'railway:signal:wrong_road:form' AS wrong_road_form,
    tags->'railway:signal:minor:deactivated' AS minor_deactivated,
    tags->'railway:signal:passing:deactivated' AS passing_deactivated,
    tags->'railway:signal:shunting:deactivated' AS shunting_deactivated,
    tags->'railway:signal:stop:deactivated' AS stop_deactivated,
    tags->'railway:signal:stop_demand:deactivated' AS stop_demand_deactivated,
    tags->'railway:signal:station:distant:deactivated' AS station_distant_deactivated,
    tags->'railway:signal:crossing:distant:deactivated' AS crossing_distant_deactivated,
    tags->'railway:signal:crossing:deactivated' AS crossing_deactivated,
    tags->'railway:signal:ring:deactivated' AS ring_deactivated,
    tags->'railway:signal:whistle:deactivated' AS whistle_deactivated,
    tags->'railway:signal:departure:deactivated' AS departure_deactivated,
    tags->'railway:signal:combined:form' AS combined_form,
    tags->'railway:signal:main:form' AS main_form,
    tags->'railway:signal:distant:form' AS distant_form,
    tags->'railway:signal:train_protection:form' AS train_protection_form,
    tags->'railway:signal:main_repeated:form' AS main_repeated_form,
    tags->'railway:signal:minor:form' AS minor_form,
    tags->'railway:signal:passing:form' AS passing_form,
    tags->'railway:signal:shunting:form' AS shunting_form,
    tags->'railway:signal:stop:form' AS stop_form,
    tags->'railway:signal:stop_demand:form' AS stop_demand_form,
    tags->'railway:signal:station:distant:form' AS station_distant_form,
    tags->'railway:signal:crossing:distant:form' AS crossing_distant_form,
    tags->'railway:signal:crossing:form' AS crossing_form,
    tags->'railway:signal:ring:form' AS ring_form,
    tags->'railway:signal:whistle:form' AS whistle_form,
    tags->'railway:signal:departure:form' AS departure_form,
    tags->'railway:signal:humping:form' AS humping_form,
    tags->'railway:signal:speed_limit:form' AS speed_limit_form,
    tags->'railway:signal:combined:height' AS combined_height,
    tags->'railway:signal:main:height' AS main_height,
    tags->'railway:signal:distant:height' AS distant_height,
    tags->'railway:signal:train_protection:height' AS train_protection_height,
    tags->'railway:signal:minor:height' AS minor_height,
    tags->'railway:signal:passing:height' AS passing_height,
    tags->'railway:signal:shunting:height' AS shunting_height,
    tags->'railway:signal:stop:height' AS stop_height,
    tags->'railway:signal:stop_demand:height' AS stop_demand_height,
    tags->'railway:signal:station:distant:height' AS station_distant_height,
    tags->'railway:signal:crossing:distant:height' AS crossing_distant_height,
    tags->'railway:signal:crossing:height' AS crossing_height,
    tags->'railway:signal:ring:height' AS ring_height,
    tags->'railway:signal:whistle:height' AS whistle_height,
    tags->'railway:signal:departure:height' AS departure_height,
    tags->'railway:signal:combined:states' AS combined_states,
    tags->'railway:signal:main:states' AS main_states,
    tags->'railway:signal:distant:states' AS distant_states,
    tags->'railway:signal:train_protection:states' AS train_protection_states,
    tags->'railway:signal:minor:states' AS minor_states,
    tags->'railway:signal:passing:states' AS passing_states,
    tags->'railway:signal:shunting:states' AS shunting_states,
    tags->'railway:signal:stop:states' AS stop_states,
    tags->'railway:signal:stop_demand:states' AS stop_demand_states,
    tags->'railway:signal:station:distant:states' AS station_distant_states,
    tags->'railway:signal:crossing:distant:states' AS crossing_distant_states,
    tags->'railway:signal:crossing:states' AS crossing_states,
    tags->'railway:signal:ring:states' AS ring_states,
    tags->'railway:signal:whistle:states' AS whistle_states,
    tags->'railway:signal:departure:states' AS departure_states,
    tags->'railway:signal:main_repeated:states' AS main_repeated_states,
    tags->'railway:signal:humping:states' AS humping_states,
    tags->'railway:signal:speed_limit:states' AS speed_limit_states,
    tags->'railway:signal:combined:repeated' AS combined_repeated,
    tags->'railway:signal:main:repeated' AS main_repeated,
    tags->'railway:signal:distant:repeated' AS distant_repeated,
    tags->'railway:signal:train_protection:repeated' AS train_protection_repeated,
    tags->'railway:signal:minor:repeated' AS minor_repeated,
    tags->'railway:signal:passing:repeated' AS passing_repeated,
    tags->'railway:signal:shunting:repeated' AS shunting_repeated,
    tags->'railway:signal:stop:repeated' AS stop_repeated,
    tags->'railway:signal:stop_demand:repeated' AS stop_demand_repeated,
    tags->'railway:signal:station:distant:repeated' AS station_distant_repeated,
    tags->'railway:signal:crossing:distant:repeated' AS crossing_distant_repeated,
    tags->'railway:signal:crossing:repeated' AS crossing_repeated,
    tags->'railway:signal:ring:repeated' AS ring_repeated,
    tags->'railway:signal:whistle:repeated' AS whistle_repeated,
    tags->'railway:signal:departure:repeated' AS departure_repeated,
    tags->'railway:signal:combined:shortened' AS combined_shortened,
    tags->'railway:signal:main:shortened' AS main_shortened,
    tags->'railway:signal:distant:shortened' AS distant_shortened,
    tags->'railway:signal:train_protection:shortened' AS train_protection_shortened,
    tags->'railway:signal:minor:shortened' AS minor_shortened,
    tags->'railway:signal:passing:shortened' AS passing_shortened,
    tags->'railway:signal:shunting:shortened' AS shunting_shortened,
    tags->'railway:signal:stop:shortened' AS stop_shortened,
    tags->'railway:signal:stop_demand:shortened' AS stop_demand_shortened,
    tags->'railway:signal:station:distant:shortened' AS station_distant_shortened,
    tags->'railway:signal:crossing:distant:shortened' AS crossing_distant_shortened,
    tags->'railway:signal:crossing:shortened' AS crossing_shortened,
    tags->'railway:signal:ring:shortened' AS ring_shortened,
    tags->'railway:signal:whistle:shortened' AS whistle_shortened,
    tags->'railway:signal:departure:shortened' AS departure_shortened,
    tags->'railway:signal:combined:only_transit' AS combined_only_transit,
    tags->'railway:signal:main:only_transit' AS main_only_transit,
    tags->'railway:signal:distant:only_transit' AS distant_only_transit,
    tags->'railway:signal:train_protection:only_transit' AS train_protection_only_transit,
    tags->'railway:signal:minor:only_transit' AS minor_only_transit,
    tags->'railway:signal:passing:only_transit' AS passing_only_transit,
    tags->'railway:signal:shunting:only_transit' AS shunting_only_transit,
    tags->'railway:signal:stop:only_transit' AS stop_only_transit,
    tags->'railway:signal:stop_demand:only_transit' AS stop_demand_only_transit,
    tags->'railway:signal:station:distant:only_transit' AS station_distant_only_transit,
    tags->'railway:signal:crossing:distant:only_transit' AS crossing_distant_only_transit,
    tags->'railway:signal:crossing:only_transit' AS crossing_only_transit,
    tags->'railway:signal:ring:only_transit' AS ring_only_transit,
    tags->'railway:signal:whistle:only_transit' AS whistle_only_transit,
    tags->'railway:signal:departure:only_transit' AS departure_only_transit,
    tags->'railway:signal:combined:type' AS combined_type,
    tags->'railway:signal:main:type' AS main_type,
    tags->'railway:signal:distant:type' AS distant_type,
    tags->'railway:signal:train_protection:type' AS train_protection_type,
    tags->'railway:signal:minor:type' AS minor_type,
    tags->'railway:signal:passing:type' AS passing_type,
    tags->'railway:signal:shunting:type' AS shunting_type,
    tags->'railway:signal:stop:type' AS stop_type,
    tags->'railway:signal:stop_demand:type' AS stop_demand_type,
    tags->'railway:signal:station:distant:type' AS station_distant_type,
    tags->'railway:signal:crossing:distant:type' AS crossing_distant_type,
    tags->'railway:signal:crossing:type' AS crossing_type,
    tags->'railway:signal:ring:type' AS ring_type,
    tags->'railway:signal:whistle:type' AS whistle_type,
    tags->'railway:signal:departure:type' AS departure_type,
    tags->'railway:signal:train_protection:shape' AS train_protection_shape
  FROM openrailwaymap_osm_signals
  WHERE
    (railway IN ('signal', 'buffer_stop'))
    AND "signal_direction" IS NOT NULL
    OR railway = 'derail'
  ORDER BY
    -- distant signals are less important, signals for slower speeds are more important
    (CASE
      WHEN railway_has_key(tags, 'railway:signal:departure') THEN 15000
      WHEN railway_has_key(tags, 'railway:signal:main') THEN 10000
      WHEN railway_has_key(tags, 'railway:signal:combined') THEN 10000
      WHEN railway_has_key(tags, 'railway:signal:distant') THEN 9000
      WHEN railway_has_key(tags, 'railway:signal:train_protection') THEN 8500
      WHEN railway_has_key(tags, 'railway:signal:main_repeated') THEN 8000
      WHEN railway_has_key(tags, 'railway:signal:minor') THEN 4000
      WHEN railway_has_key(tags, 'railway:signal:passing') THEN 3500
      WHEN railway_has_key(tags, 'railway:signal:shunting') THEN 3000
      WHEN railway_has_key(tags, 'railway:signal:stop') THEN 1000
      WHEN railway_has_key(tags, 'railway:signal:stop_demand') THEN 900
      WHEN railway_has_key(tags, 'railway:signal:station_distant') THEN 550
      WHEN railway_has_key(tags, 'railway:signal:crossing') THEN 1000
      WHEN railway_has_key(tags, 'railway:signal:crossing_distant') THEN 500
      WHEN railway_has_key(tags, 'railway:signal:ring') THEN 500
      WHEN railway_has_key(tags, 'railway:signal:whistle') THEN 500
      ELSE 0
    END) ASC NULLS FIRST;

CREATE OR REPLACE VIEW signal_boxes_text AS
  SELECT
    way,
    ref,
    name,
--     is_point,
    way_area
  FROM (
    SELECT
        way,
        tags->'railway:ref' AS ref,
        name,
--         1::int AS is_point,
        0::real AS way_area
      FROM openrailwaymap_osm_point
      WHERE railway = 'signal_box'
    UNION ALL
    SELECT
        ST_PointOnSurface(way) AS way,
        tags->'railway:ref' AS ref,
        -- (way_area/NULLIF(POW(!scale_denominator!*0.001*0.28, 2),0))::text AS ref,
        name,
--         CASE
--           WHEN way_area/NULLIF(POW(!scale_denominator!*0.001*0.28,2),0) < 24::real THEN 1::int
--           ELSE 0::int
--         END AS is_point,
        way_area
      FROM openrailwaymap_osm_polygon
      WHERE railway = 'signal_box'
  ) AS pointpolygons
  ORDER BY way_area DESC NULLS LAST;
