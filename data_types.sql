CREATE TABLE char_data_types (
	char_column CHAR(10),
	varchar_column VARCHAR(10),
	text_column TEXT
);

INSERT INTO char_data_types
VALUES 
	('abc', 'abc', 'abc'),
	('defghi', 'defghi', 'defghi');

COPY char_data_types TO 'C:\postgres_exports\typetest.txt'
--\copy char_data_types TO 'C:\postgres_exports\typetest.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

/*Understandin numbers

Integers: smallint, integer, bigint (Consumes the most storage)
autoincrementing with serial: smallserial, serial, bigserial*/

CREATE TABLE people (
	id SERIAL,
	person_name VARCHAR(100)
);

/*IDENTITY: The standard SQL implementation for auto-in*/