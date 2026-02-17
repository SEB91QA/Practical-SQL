/*Understanding the three types of Table relationships*/

/*One-to-one relationship*/
/*Any given id in either table will find no more than 
one match in the other table*/

/*One-to-Many relationship*/
/*A key value in one table will have multiple
matching values in another table's joined column.*/

/*Many-to-Many Relationships*/
/*Multiple items in one table can relate to multiple 
items in another table, and vice versa*/

SELECT district_2020.id,
	   district_2020.school_2020,
	   district_2035.school_2035

	   FROM district_2020 LEFT JOIN district_2035
	   ON district_2020.id = district_2035.id
	   ORDER BY district_2020.id;

SELECT d20.id,
	   d20.school_2020,
	   d35.school_2035

	   FROM district_2020 AS d20 
	     LEFT JOIN district_2035 AS d35
	       ON d20.id = d35.id
	   
	   ORDER BY d20.id;