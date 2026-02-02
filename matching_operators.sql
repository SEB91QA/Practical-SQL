SELECT first_name, last_name, school
FROM teachers
--WHERE first_name = 'Janet';
--WHERE school <> 'F.D Roosevelt HS';
--WHERE hire_date < '2000-01-01';
--WHERE salary >= 43500;
WHERE salary BETWEEN 40000 AND 65000;