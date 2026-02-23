/*Chapter 8 Composite example*/

CREATE TABLE natural_key_composite_example (
	student_id TEXT,
	school_day DATE,
	present BOOL,
	CONSTRAINT student_key PRIMARY KEY (student_id, school_day)
);

INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES (775, '2022-01-22', 'Y');

INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES (775, '2022-01-23', 'Y');

INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES (775, '2022-01-23', 'N');

CREATE TABLE surrogate_key_example (
	order_number BIGINT GENERATED ALWAYS AS IDENTITY,
	product_name TEXT,
	order_time TIMESTAMP WITH TIME ZONE,
	CONSTRAINT order_number_key PRIMARY KEY (order_number)
);

INSERT INTO surrogate_key_example (product_name, order_time)
VALUES ('Beachball Polish', '2020-03-15 09:21-07'),
	   ('Wrinkle De-Atomizer', '2017-05-22 14:00-07'),
	   ('Flux Capacitor', '1985-10-26 01:18:00-07');

INSERT INTO surrogate_key_example
OVERRIDING SYSTEM VALUE
VALUES (4, 'Chicken Coop', '2021-09-03 10:33-07');

ALTER TABLE surrogate_key_example ALTER COLUMN order_number RESTART WITH 5;

INSERT INTO surrogate_key_example (product_name, order_time)
VALUES ('Aloe Plant', '2022-03-15 10:09-07');

CREATE TABLE licenses (
	license_id TEXT,
	first_name TEXT,
	last_name TEXT,
	CONSTRAINT licenses_key PRIMARY KEY (license_id)
);

CREATE TABLE registrations (
	registration_id TEXT,
	registration_date TIMESTAMP WITH TIME ZONE,
	license_id TEXT REFERENCES licenses (license_id) ON DELETE CASCADE,
	CONSTRAINT registration_key PRIMARY KEY (registration_id, license_id)
);

INSERT INTO licenses (license_id, first_name, last_name)
VALUES ('T229901', 'Steve', 'Rothery');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A203391', '2022-03-17', 'T229901');

--The following script will trigger an error since license_id 'T000001' cannot be reference 
--in table licenses.
INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A75772', '2022-03-17', 'T000001');

/*Automatically delete related records with CASCADE*/


