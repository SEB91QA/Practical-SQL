/*Employees table*/
CREATE TABLE employees (
	emp_id INTEGER,
	first_name TEXT,
	last_name TEXT,
	salary NUMERIC(10, 2),
	dept_id INTEGER REFERENCES departments (dept_id),
	CONSTRAINT emp_key PRIMARY KEY (emp_id)
);