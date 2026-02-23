/*Adding a Value to a column during import*/
/*Temporary table to import values*/
CREATE TEMPORARY TABLE supervisor_salaries_temp
	(LIKE supervisor_salaries INCLUDING ALL);

COPY supervisor_salaries_temp (town, supervisor, salary)
FROM 'C:\postgres_exports\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Mills', supervisor, salary
FROM supervisor