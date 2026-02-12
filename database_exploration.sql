/*Check the columns to see if there are any discrepancies in the data*/
SELECT
	county_name AS county,
	state_name AS state,
	pop_est_2019 AS pop,
	pop_est_2018 + births_2019 - deaths_2019
		+ international_migr_2019 + domestic_migr_2019
		+ residual_2019 AS components_total,
		
	pop_est_2019 - (pop_est_2018 + births_2019 - deaths_2019
					+ international_migr_2019 + domestic_migr_2019
					+ residual_2019) AS differences

	FROM us_counties_pop_est_2019
	ORDER BY differenceS DESC;