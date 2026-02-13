/*Joining Tables in a Relational Database*/
--Edgar F. Codd coined the name Relational Database while working for IBM in 1970


CREATE TABLE departments (
	dept_id INTEGER,
	dept TEXT,
	city TEXT,
	CONSTRAINT dept_key PRIMARY KEY (dept_id),
	CONSTRAINT dept_city_unique UNIQUE (dept, city)
);

