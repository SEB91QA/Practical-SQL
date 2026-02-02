/*Floating-point types are referred to as "inexact". 
The computer attempts to squeeze lots of information into a finite
number of bits*/

/*Numeric can consume considerably more space than the floating-point types*/
SELECT

	numeric_column * 10000000 AS fixed,
	real_column * 10000000 AS floating

	FROM number_data_types
	WHERE numeric_column = .7;

-- Use integers when possible
-- If you need calculations to be exact, use numeric or its equivalent, decimal
-- Use floating-point when exactness is not as important
-- Choose a big enough number type
