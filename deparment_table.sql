/*Joining Tables in a Relational Database*/
--Edgar F. Codd coined the name Relational Database while working for IBM in 1970


CREATE TABLE departments (
	dept_id INTEGER,
	dept TEXT,
	city TEXT,
	CONSTRAINT dept_key PRIMARY KEY (dept_id),
	CONSTRAINT dept_city_unique UNIQUE (dept, city)
);

/*Employees table*/
CREATE TABLE employees (
	emp_id INTEGER,
	first_name TEXT,
	last_name TEXT,
	salary NUMERIC(10, 2),
	dept_id INTEGER REFERENCES departments (dept_id),
	CONSTRAINT emp_key PRIMARY KEY (emp_id)
);

--It uses Codd's relational model. Each describes attributes about a single entity
/*A primary key is a column or collection of columns whose values 
uniquely identify each row in a table*/
--The column or collection of columns must have a unique value for each row
--The column or collection of columns can't have missing values

/*Foreign key constraint requires that its values already exits in the column its references*/
--It can be empty and can contain duplicate values

/*Unique constrainr garantees that values in a column or comination of values in more
than one column, are unique*/

