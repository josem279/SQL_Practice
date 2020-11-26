-- Chapter 4: Importing and Exporting Data
-- Challenge Questions


/*
Question 1: Write a WITH statement to include with COPY to handle the import of an imaginary text file whose first couple of rows look like this:
---------
id:movie:actor
50:#Mission: Impossible#:Tom Cruise
---------
*/ 

COPY example_table
FROM 'C:/RandomDirectory/indicatedtextfile.txt'
WITH (FORMAT CSV, HEADER, DELIMITER ':', QUOTE '#');

/*
Question 2: Using the table us_counties_2010_ you created and filled in this chapter, export to a CSV file the 20 counties in the United States that
have the most housing units. Make sure you export only each county's name, state, and number of housing units.
*/

COPY (
	SELECT geo_name, state_us_abbreviation, housing_unit_count
	FROM us_counties_2010
	ORDER BY housing_unit_count DESC
	LIMIT 20
)
TO 'C:/RandomDirectory/housing_export.csv'
WITH (FORMAT CSV, HEADER);

/*
Question 3: Imagine you're importing a file that contains a column with these values:
----
17519.668
20084.461
18973.335
----
Will a column in your target table with data type NUMERIC(3,8) work for these values?

Answer 3: The data type NUMERIC(3,8) will not work as it has switched the precision and scale values. It should instead be NUMERIC(8,3) to indicate
that there should be 8 total digits with only 3 of them being to the right of the decimal.
*/