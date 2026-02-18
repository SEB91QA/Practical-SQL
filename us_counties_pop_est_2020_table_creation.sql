/*Performing Math on Joined Table columns*/
CREATE TABLE us_counties_pop_est_2010 (
	state_fips TEXT,
	county_fips TEXT,
	region SMALLINT,
	state_name TEXT,
	county_name TEXT,
	estimates_base_2010 INTEGER,
	CONSTRAINT counties_2010_key PRIMARY KEY (state_fips, county_fips)
);