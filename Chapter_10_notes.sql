/*Chapter 10 Notes*/

CREATE TABLE meat_poultry_egg_establishments (
	establishment_number TEXT CONSTRAINT est_number_key PRIMARY KEY,
	company TEXT,
	street TEXT,
	city TEXT,
	st TEXT,
	zip TEXT,
	phone TEXT,
	grant_date DATE,
	activities TEXT,
	dbas TEXT
);

COPY meat_poultry_egg_establishments
FROM 'C:\postgres_exports\MPI_Directory_by_Establishment_Name.csv'
WITH (FORMAT CSV, HEADER);

CREATE INDEX company_idx ON meat_poultry_egg_establishments (company);

SELECT COUNT(*) FROM meat_poultry_egg_establishments;

/*Rows that show only cases where more than one row has the same combination of values*/
SELECT	company,
		street,
		city,
		st,
		COUNT(*) AS address_count

		FROM meat_poultry_egg_establishments
		GROUP BY company, street, city, st
		HAVING COUNT(*) > 1
		ORDER BY company, street, city, st;

/*Two types of processing plants cloud exist with the same name.*/

SELECT	st,
		COUNT(*) AS st_count

		FROM meat_poultry_egg_establishments
		GROUP BY st
		ORDER BY st NULLS FIRST;

SELECT	establishment_number,
		company,
		city,
		st,
		zip

		FROM meat_poultry_egg_establishments
		WHERE st IS NULL;

/*There are mispellings that we need to take into account when grouping.*/
SELECT	company,
		COUNT(*) AS company_count

		FROM meat_poultry_egg_establishments
		GROUP BY company
		ORDER BY company ASC;

/*Be careful when declaring a column as a number. Some numbers might have
zeros at the beginning.*/
SELECT	LENGTH(zip),
		COUNT(*) AS length_count

		FROM meat_poultry_egg_establishments
		GROUP BY LENGTH(zip)
		ORDER BY LENGTH(zip) ASC;


SELECT	st,
		COUNT(*) st_count

		FROM meat_poultry_egg_establishments
		WHERE LENGTH(zip) < 5
		GROUP BY st
		ORDER BY st ASC;
/*Modifying tables, columns, and Data*/
ALTER TABLE table ADD COLUMN data_type;
ALTER TABLE table DROP COLUMN column;
ALTER TABLE table ALTER COLUMN column SET DATA TYPE data_type;
ALTER TABLE table ALTER COLUMN column SET NOT NULL;
ALTER TABLE table ALTER COLUMN column DROP NOT NULL;

UPDATE table
SET column_a = value
	column_b = value;

UPDATE table
SET column = value
WHERE criteria;

/*We can also update one table with values from another table*/
UPDATE table
SET column = (SELECT column
			  FROM table_b
			  WHERE table.column = table_b.column);

/*It is important to add this condition so we don't set some values to NULL*/
WHERE EXISTS (SELECT column
			  FROM table_b
			  WHERE table.column = table_b.column);

UPDATE table
SET column = table_b.column
FROM table_b
WHERE table.column = table_b.column;

/*Viewing Modified Data with RETURNING*/
/*You can view  the values that were modified without having to run a second*/

UPDATE table
SET column_a = value
RETURNING column_a, column_b, column_c;

/*Create backup tables for reference*/

CREATE TABLE meat_poultry_egg_establishments_backup AS
SELECT * FROM meat_poultry_egg_establishments;

SELECT
	(SELECT COUNT(*) FROM meat_poultry_egg_establishments) AS original,
	(SELECT COUNT(*) FROM meat_poultry_egg_establishments_backup) AS backup;
	