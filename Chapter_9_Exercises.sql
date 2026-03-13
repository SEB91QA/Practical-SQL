/*Exercises Chapter 9*/
SELECT MAX(totstaff), MIN(totstaff)
FROM pls_fy2018_libraries;

SELECT pls18.stabr,
	   SUM(pls18.totstaff) AS totstaff_2018,
	   SUM(pls17.totstaff) AS totstaff_2017,
	   SUM(pls16.totstaff) AS totstaff_2016,
	   ROUND((SUM(pls18.totstaff::NUMERIC) - SUM(pls17.totstaff))/SUM(pls17.totstaff) * 100, 1) AS chg_2018_17,
	   ROUND((SUM(pls17.totstaff::NUMERIC) - SUM(pls16.totstaff))/SUM(pls16.totstaff) * 100, 1) AS chg_2017_16

	   FROM pls_fy2018_libraries AS pls18
	     JOIN pls_fy2017_libraries AS pls17
		   ON pls18.fscskey = pls17.fscskey
		   
		 JOIN pls_fy2016_libraries AS pls16
		   ON pls16.fscskey = pls18.fscskey
	   
	   WHERE pls18.totstaff >= 0
	   		 AND
		     pls17.totstaff >= 0
			 AND
			 pls16.totstaff >= 0
	
	   GROUP BY pls18.stabr
	   ORDER BY chg_2018_17 DESC;

SELECT obereg FROM pls_fy2018_libraries GROUP BY obereg;

SELECT pls18.obereg,
	   SUM(pls18.visits) AS visits_2018,
	   SUM(pls17.visits) AS visits_2017,
	   SUM(pls16.visits) AS visits_2016,
	   ROUND((SUM(pls18.visits::NUMERIC) - SUM(pls17.visits))/SUM(pls17.visits) * 100, 1) AS chg_2018_17,
	   ROUND((SUM(pls17.visits::NUMERIC) - SUM(pls16.visits))/SUM(pls16.visits) * 100, 1) AS chg_2017_16

	   FROM pls_fy2018_libraries AS pls18
	     JOIN pls_fy2017_libraries AS pls17
		   ON pls18.fscskey = pls17.fscskey
		   
		 JOIN pls_fy2016_libraries AS pls16
		   ON pls16.fscskey = pls18.fscskey
	   
	   WHERE pls18.visits >= 0
	   		 AND
		     pls17.visits >= 0
			 AND
			 pls16.visits >= 0
	
	   GROUP BY pls18.obereg
	   ORDER BY chg_2018_17 DESC;

CREATE TABLE region (
	region_id TEXT,
	region_name TEXT,
	CONSTRAINT region_id_key PRIMARY KEY (region_id),
	CONSTRAINT region_values CHECK (region_id IN ('01', '02', '03',
												  '04', '05', '06',
												  '07', '08', '09'))
);

INSERT INTO region 
VALUES ('01', 'New England'),
	   ('02', 'Middle Atlantic'),
	   ('03', 'East North Central'),
	   ('04', 'West North Central'),
	   ('05', 'South Atlantic'),
	   ('06', 'East South Central'),
	   ('07', 'West South Central'),
	   ('08', 'Mountain'),
	   ('09', 'Pacific');

SELECT r.region_name, 
	   SUM(pls18.visits) AS visits_2018,
	   SUM(pls17.visits) AS visits_2017,
	   SUM(pls16.visits) AS visits_2016,
	   ROUND((SUM(pls18.visits::NUMERIC) - SUM(pls17.visits))/SUM(pls17.visits) * 100, 1) AS chg_2018_17,
	   ROUND((SUM(pls17.visits::NUMERIC) - SUM(pls16.visits))/SUM(pls16.visits) * 100, 1) AS chg_2017_16

	   FROM pls_fy2018_libraries AS pls18
	     JOIN pls_fy2017_libraries AS pls17
		   ON pls18.fscskey = pls17.fscskey
		   
		 JOIN pls_fy2016_libraries AS pls16
		   ON pls16.fscskey = pls18.fscskey

		 JOIN region AS r
		   ON pls18.obereg = r.region_id
	   
	   WHERE pls18.visits >= 0
	   		 AND
		     pls17.visits >= 0
			 AND
			 pls16.visits >= 0
	
	   GROUP BY r.region_name
	   ORDER BY chg_2018_17 DESC;

SELECT pls18.libname, pls18.city, pls18.stabr, pls18.statstru,
	   pls17.libname, pls17.city, pls17.stabr, pls17.statstru,
	   pls16.libname, pls16.city, pls16.stabr, pls16.statstru

	   FROM pls_fy2018_libraries AS pls18
	     FULL OUTER JOIN pls_fy2017_libraries AS pls17
		   ON pls18.fscskey = pls17.fscskey

		 FULL OUTER JOIN pls_fy2016_libraries AS pls16
		   ON pls18.fscskey = pls16.fscskey

	   WHERE pls16.fscskey IS NULL OR pls17.fscskey IS NULL;
	   -- This limits the results to those that do not
	   -- appear in one or more tables.
