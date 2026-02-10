COPY us_counties_pop_est_2019
TO 'C:\postgres_exports\us_counties_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');