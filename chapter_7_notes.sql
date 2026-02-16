/*Querying multiple tables. The database connects rows in both tables
where the columns you specified for the join have values that result oin the
ON clause expression returning true*/

SELECT * FROM employees JOIN departments
ON employees.dept_id = departments.dept_id
ORDER BY employees.dept_id;

/*Understanding JOIN Types*/

--JOIN: Returns rows from both tables where matching values are found
--LEFT JOIN: Returns every row from the left table
--RIGHT JOIN: Returns every tow from the right table.
--FULL OUTER JOIN: Returns every tow from both tables and joins the rows where values in the joined columns match.
--CROSS JOIN: Returns every possible combination of rows from both tables

