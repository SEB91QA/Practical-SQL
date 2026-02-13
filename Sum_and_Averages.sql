/*Averages and Sums*/

SELECT 
	SUM(pop_est_2019) AS county_sum,
	ROUND(AVG(pop_est_2019), 0) AS county_average

	FROM us_counties_pop_est_2019;


/*Finding the Median*/
CREATE TABLE percentile_test (
	numbers INTEGER
);

INSERT INTO percentile_test (numbers)
	VALUES (1), (2), (3), (4), (5), (6);


	


