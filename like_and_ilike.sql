SELECT first_name
FROM teachers
--WHERE first_name LIKE 'sam%';
WHERE first_name ILIKE 'sam%';
--Review %% and _