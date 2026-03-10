/*Chapter 9. Extracting Information by grouping and summarizing*/

CREATE TABLE pls_fy2018_libraries (
    stabr text NOT NULL,
    fscskey text CONSTRAINT fscskey_2018_pkey PRIMARY KEY,
    libid text NOT NULL,
    libname text NOT NULL,
    address text NOT NULL,
    city text NOT NULL,
    zip text NOT NULL,
    county text NOT NULL,
    phone text NOT NULL,
    c_relatn text NOT NULL,
    c_legbas text NOT NULL,
    c_admin text NOT NULL,
    c_fscs text NOT NULL,
    geocode text NOT NULL,
    lsabound text NOT NULL,
    startdate text NOT NULL,
    enddate text NOT NULL,
    popu_lsa integer NOT NULL,
    popu_und integer NOT NULL,
    centlib integer NOT NULL,
    branlib integer NOT NULL,
    bkmob integer NOT NULL,
    totstaff numeric(8,2) NOT NULL,
    bkvol integer NOT NULL,
    ebook integer NOT NULL,
    audio_ph integer NOT NULL,
    audio_dl integer NOT NULL,
    video_ph integer NOT NULL,
    video_dl integer NOT NULL,
    ec_lo_ot integer NOT NULL,
    subscrip integer NOT NULL,
    hrs_open integer NOT NULL,
    visits integer NOT NULL,
    reference integer NOT NULL,
    regbor integer NOT NULL,
    totcir integer NOT NULL,
    kidcircl integer NOT NULL,
    totpro integer NOT NULL,
    gpterms integer NOT NULL,
    pitusr integer NOT NULL,
    wifisess integer NOT NULL,
    obereg text NOT NULL,
    statstru text NOT NULL,
    statname text NOT NULL,
    stataddr text NOT NULL,
    longitude numeric(10,7) NOT NULL,
    latitude numeric(10,7) NOT NULL
);

COPY pls_fy2018_libraries
FROM 'C:\postgres_exports\pls_fy2018_libraries.csv'
WITH (FORMAT CSV, HEADER);

CREATE INDEX libname_2018_idx ON pls_fy2018_libraries (libname);

SELECT COUNT(*)
FROM pls_fy2018_libraries;

SELECT COUNT(*)
FROM pls_fy2017_libraries;

SELECT COUNT(*)
FROM pls_fy2016_libraries;

SELECT COUNT(phone)
FROM pls_fy2018_libraries;

SELECT COUNT(libname)
FROM pls_fy2018_libraries;

SELECT COUNT(DISTINCT libname)
FROM pls_fy2018_libraries;

SELECT MAX(visits), MIN(visits)
FROM pls_fy2018_libraries;

/*Negative values in number columns might indicate: nonresponse, not applicable. Always read
the documentation of the data. And instead of using negative values scenario, use NULL in rows
int the column where the data is absent and then create a separate visists_flag column to hold
codes explaining why.*/

SELECT stabr
FROM pls_fy2018_libraries
GROUP BY stabr
ORDER BY stabr;

SELECT city, stabr
FROM pls_fy2018_libraries
GROUP BY city, stabr
ORDER BY city, stabr;

SELECT stabr, COUNT(*)
FROM pls_fy2018_libraries
GROUP BY stabr
ORDER BY stabr DESC;

SELECT SUM(visits) AS visits_2018
FROM pls_fy2018_libraries
WHERE visits >= 0;

SELECT SUM(visits) AS visits_2017
FROM pls_fy2017_libraries
WHERE visits >= 0;

SELECT SUM(visits) AS visits_2016
FROM pls_fy2016_libraries
WHERE visits >= 0;

SELECT SUM(pls18.visits) AS visits_2018,
	   SUM(pls17.visits) AS visits_2017,
	   SUM(pls16.visits) AS visits_2016

	   FROM pls_fy2018_libraries AS pls18
	     JOIN pls_fy2017_libraries AS pls17
		   ON pls18.fscskey = pls17.fscskey

	     JOIN pls_fy2016_libraries AS pls16
		   ON pls16.fscskey = pls18.fscskey

	   WHERE pls18.visits >= 0
	   		 AND
		     pls17.visits >= 0
			 AND
			 pls16.visits >= 0;

SELECT pls18.stabr,
	   SUM(pls18.visits) AS visits_2018,
	   SUM(pls17.visits) AS visits_2017,
	   SUM(pls16.visits) AS visits_2016,
	   ROUND((SUM(pls18.visits::NUMERIC) - SUM(pls17.visits))/SUM(pls17.visits) * 100, 1) AS chg_2018_17,
	   ROUND((SUM(pls17.visits::NUMERIC) - SUM(pls16.visits))/SUM(pls16.visits) * 100, 1) AS chg_2017_16

	   FROM pls_fy2018_libraries AS pls18
	     JOIN pls_fy2017_libraries AS pls17
		   ON pls18.fscskey = pls17.fscskey
		   
		 JOIN pls_fy2016_libraries AS pls16
		   ON pls16.fscskey = pls18.fscskey
	   
	   WHERE pls18.visits >= 0
	   		 AND
		     pls17.visits >= 0
			 AND
			 pls16.visits >= 0
	
	   GROUP BY pls18.stabr
	   ORDER BY chg_2018_17 DESC;
			 
/*Always make sense of the data. Data analysis can sometimes raise as many questions as it answers, 
but thats part of the process. */