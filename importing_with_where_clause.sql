COPY supervisor_salaries (town, supervisor, salary)
FROM 'C:\postgres_exports\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER)
WHERE town = 'New Brillig'