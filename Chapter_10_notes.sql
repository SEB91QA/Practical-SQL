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
		WHERE st IS NULL