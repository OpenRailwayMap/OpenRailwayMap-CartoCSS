-- Remove platforms which are not near any railway line, and also not part of
-- any railway route
DELETE FROM platforms p
  WHERE NOT EXISTS(
    SELECT *
      FROM routes r
      WHERE r.platform_ref_ids @> Array[p.osm_id])
        AND NOT EXISTS(
          SELECT * FROM railway_line l WHERE st_dwithin(p.way, l.way, 20)
        );
