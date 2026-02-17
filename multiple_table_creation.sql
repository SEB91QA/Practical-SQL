CREATE TABLE district_2020_enrollment (
	id INTEGER,
	enrollment INTEGER
);

CREATE TABLE district_2020_grades (
	id INTEGER,
	grades VARCHAR(10)
);

INSERT INTO district_2020_enrollment
VALUES (1, 360),
	   (2, 1001),
	   (5, 450),
	   (6, 927);

INSERT INTO district_2020_grades
VALUES (1, 'K-3'),
	   (2, '9-12'),
	   (5, '6-8'),
	   (6, '9-12');
