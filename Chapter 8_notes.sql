/*Chapter 8*/

/*Types of Constraints*/

/*

CHECK: Allows only those rows where a supplied Booleans expression evaluates to true

UNIQUE: Ensures that in a column or a group of calumns are unique in each row in the table

NOT NULL: Prevents NULL values in a column

We cab gave contraints as: column constraints or table constraints. We can create composite primary keys
by combining driver_id with a column holding the state name

Surrogate key: Single column that you fill with artificial valyes- We might use it when a table doesn't
have data that supports creating a natural primary key..

Universal unique identifier (UUID) is a code comprised of 32 hexadecimal digits in groups separated by hyphens

*/

/*Column Constraint*/
CREATE TABLE natural_key_example(
	license_id TEXT CONSTRAINT license_key PRIMARY KEY,
	first_name TEXT,
	last_name TEXT
);

DROP TABLE natural_key_example;

/*Table Constraint*/
CREATE TABLE natural_key_example (
	license_id TEXT,
	first_name TEXT,
	last_name TEXT,
	CONSTRAINT license_key PRIMARY KEY (license_id)
	--It must be used whe you want to create a primary key using more than one column
);


/*Auto-Incrementing Surrogate Key*/
/*Since using GENERATED ALWAYS AS IDENTITY robids adding manual rows,
however we can use the command OVERRIDING SYSTEM VALUE to add a manual
row, it overrides the IDENTITY restriction. 

We can reset the identity of the column by using ALTER TABLE and ALTER COLUMN
along with the RESTART WITH 5.*/


/*Foreing Keys*/
/*A foregin key is one or more columns whose values match those in another table's
primary key or another unique key. Foregin key values must already exist in the 
primary key or other unique key of the table it references -> Referential integrity*/

--The command ON DELETE CASCADE allows to automatically delete any related rows
