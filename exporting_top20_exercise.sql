COPY(
	SELECT state_name, county_name, births_2019
	FROM us_counties_pop_est_2019 ORDER BY births_2019 DESC
	LIMIT 20)
TO 'C:\postgres_exports\top20_births.csv'
WITH(FORMAT CSV, HEADER);
