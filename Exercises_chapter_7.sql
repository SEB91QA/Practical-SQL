/*Exercises Chapter 7*/
/*Eden Detention Center closed back in 2019*/
SELECT

  c2019.county_name,
  c2019.state_name,
  c2019.pop_est_2019 AS pop_2019,
  c2010.estimates_base_2010 AS pop_2010,
  c2019.pop_est_2019 - c2010.estimates_base_2010 AS raw_change,
  ROUND((c2019.pop_est_2019::NUMERIC - C2010.estimates_base_2010)/c2010.estimates_base_2010 * 100, 1) AS pct_change
 

  FROM us_counties_pop_est_2019 AS c2019
  	JOIN us_counties_pop_est_2010 AS c2010
	  ON c2019.state_fips = c2010.state_fips
	     AND
		 c2019.county_fips = c2010.county_fips
  ORDER BY pct_change ASC;

/*UNION commnad removes duplicates*/

  SELECT

  '2019' AS Year,
  state_fips,
  county_fips,
  c2019.state_name AS State_name,
  c2019.county_name AS County_name,
  c2019.pop_est_2019 AS Population

  FROM us_counties_pop_est_2019 AS c2019

  UNION
  
  SELECT

  '2010' AS Year,
  state_fips,
  county_fips,
  c2010.state_name AS State_name,
  c2010.county_name AS County_name,
  c2010.estimates_base_2010 AS Population

  FROM us_counties_pop_est_2010 AS c2010;

/*Answer is -0.5*/

SELECT

  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ROUND((c2019.pop_est_2019::NUMERIC - C2010.estimates_base_2010)
         											 /c2010.estimates_base_2010 * 100, 1)) AS percentile_50th

  FROM us_counties_pop_est_2019 AS c2019
    JOIN us_counties_pop_est_2010 AS c2010
	  ON c2019.state_fips = c2010.state_fips
	     AND
		 c2019.county_fips = c2010.county_fips;

  

  

	
  