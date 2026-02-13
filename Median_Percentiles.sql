/*Median and Percentiles with Census Data*/
SELECT
	SUM(pop_est_2019) AS county_sum,
	ROUND(AVG(pop_est_2019), 0) AS county_average,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY pop_est_2019) AS county_median

	FROM us_counties_pop_est_2019;

SELECT
	PERCENTILE_CONT(ARRAY[0.25, 0.5, 0.75]) WITHIN GROUP (ORDER BY pop_est_2019) AS quartiles

	FROM us_counties_pop_est_2019;

/*Finding the Mode*/

SELECT
	MODE() WITHIN GROUP (ORDER BY births_2019)

	FROM us_counties_pop_est_2019;