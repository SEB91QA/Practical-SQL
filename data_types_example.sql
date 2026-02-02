CREATE TABLE number_data_types (
	numeric_column NUMERIC(20, 5), -- Up to 131,072 before decimal point; up to 16,383 digits after the decimal point
	real_column REAL,  -- 6 decimal digits precision
	double_column DOUBLE PRECISION -- 15 decimal digits precision
);

INSERT INTO number_data_types
VALUES
	(.7, .7, .7),
	(2.13579, 2.13579, 2.13579),
	(2.1357987654, 2.1357987654, 2.1357987654);

SELECT * FROM number_data_types;