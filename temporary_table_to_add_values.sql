/*Adding a Value to a column during import*/
/*Temporary table to import values*/
CREATE TEMPORARY TABLE supervisor_salaries_temp
	(LIKE supervisor_salaries INCLUDING ALL); --This creates the temp based on the first table, not only the rows but indexes and identity settings as well

COPY supervisor_salaries_temp (town, supervisor, salary)
FROM 'C:\postgres_exports\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER); --We import the table from the data that is available

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Mills', supervisor, salary
FROM supervisor_salaries_temp;

DROP TABLE supervisor_salaries_temp;