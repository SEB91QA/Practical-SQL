/*Importing data into the table*/
COPY us_counties_pop_est_2019
FROM 'C:\postgres_exports\us_counties_pop_est_2019.csv'
WITH (FORMAT CSV, HEADER);