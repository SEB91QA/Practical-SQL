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
	
	   GROUP BY pls18.stabr;
	   OR