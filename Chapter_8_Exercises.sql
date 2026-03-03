/*Exercises - Chapter 9*/
CREATE TABLE albums (
	album_id BIGINT GENERATED ALWAYS AS IDENTITY,
	catalog_code TEXT NOT NULL, --This column could be considered as a surrogate key
	title TEXT NOT NULL,
	artist TEXT NOT NULL,
	realese_data DATE, --This query is a candidate to add an index
	genre TEXT,
	description TEXT,
	CONSTRAINT album_id_key PRIMARY KEY (album_id),
	CONSTRAINT realese_date_check CHECK (realese_date >= '01/01/2000') 
);

CREATE TABLE songs (
	song_id BIGINT GENERATED ALWAYS AS IDENTITY,
	title TEXT NOT NULL,
	composer TEXT NOT NULL,
	album_id BIGINT REFERENCES albums (album_id) DELETE ON CASCADE, --This query is a candidate to add an index
	CONSTRAINT song_id_key PRIMARY KEY (song_id)
);