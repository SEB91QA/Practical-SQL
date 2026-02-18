COPY us_counties_pop_est_2010
FROM 'C:\postgres_exports\us_counties_pop_est_2010.csv'
WITH (FORMAT CSV, HEADER);