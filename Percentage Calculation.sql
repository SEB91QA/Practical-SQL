/*Percentage Caclculation*/
SELECT
	county_name AS county,
	state_name AS state,
	/*Cast one of the integers as numeric to obtain the value*/
	area_water::NUMERIC / (area_land + area_water) * 100 AS pct_water 
	
	FROM us_counties_pop_est_2019
	ORDER BY pct_water DESC;

/*Tracking the percentage change*/
CREATE TABLE percent_change (
	department TEXT,
	spend_2019 NUMERIC(10, 2),
	spend_2022 NUMERIC(10, 2)
);

INSERT INTO percent_change
VALUES ('Assessor', 178556, 179500),
	   ('Building', 250000, 289000),
	   ('Clerk', 451980, 650000),
	   ('Library', 87777, 90001),
	   ('Parks', 250000, 223000),
	   ('Water', 199000, 195000);

SELECT
	department,
	spend_2019,
	spend_2022,
	ROUND((spend_2022 - spend_2019)/spend_2019 * 100, 1) AS pct_change

	FROM percent_change;