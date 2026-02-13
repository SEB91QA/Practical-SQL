/*Percentiles*/
SELECT
	PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY numbers), --Calculates percentiles as continous values
	PERCENTILE_DISC(.5) WITHIN GROUP (ORDER BY numbers)  --Calculates percentiles as discrete values

	FROM percentile_test;

