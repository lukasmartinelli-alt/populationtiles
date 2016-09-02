CREATE TABLE population_grid AS (
	SELECT rid, (gv).x, (gv).y, (gv).val AS population, (gv).geom AS geom
	FROM (
		SELECT rid, ST_PixelAsPolygons(rast) AS gv
		FROM gpw_v4_pop_density_2015
	) AS t
);
CREATE INDEX population_grid_geom ON population_grid USING GIST(geom);
