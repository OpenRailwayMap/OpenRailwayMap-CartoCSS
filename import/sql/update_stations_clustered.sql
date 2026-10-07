-- Refresh materialized view of stations and their importance

REFRESH MATERIALIZED VIEW stations_clustered;
REFRESH MATERIALIZED VIEW CONCURRENTLY grouped_stations_with_importance;
REFRESH MATERIALIZED VIEW CONCURRENTLY stop_area_groups_buffered;
REFRESH MATERIALIZED VIEW CONCURRENTLY interlocking_buffered;
