/*Combining Query results with set operators

UNION: It appends the rows from the first and second results
	   removing duplicates. Using UNION ALL return all rows
	   including duplicates

INTERSECT: Include the rows  that exist in the results of both 
		   queries and removes duplicates.


EXCEPT: Returns rows that exist in the results of the first query 
		but not in the results of the second query*/

SELECT * FROM district_2020
UNION
SELECT * FROM district_2035
ORDER BY id;

SELECT * FROM district_2020
UNION ALL
SELECT * FROM district_2035
ORDER BY id;

SELECT 

'2020' AS year,
school_2020 AS school

FROM district_2020

UNION ALL

SELECT

'2035'  AS year,
school_2035 AS school

FROM district_2035
ORDER BY school, year;

SELECT * FROM district_2020
INTERSECT
SELECT * FROM district_2035;

SELECT * FROM district_2020
EXCEPT
SELECT * FROM district_2035;


