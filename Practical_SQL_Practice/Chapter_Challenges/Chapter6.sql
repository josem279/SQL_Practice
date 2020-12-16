-- Chapter 6: Joining Tables in a Relational Database
-- Challenge Questions

/*
Question 1: The table us_counties_2010 contains 3143 rows, and us_counties_2000 has 3141. That reflects the ongoing adjustments to 
county level geographies that typically result from government decision making. Using appropriate joins and the NULL value, identify which counties
don't exist in both tables.


-- Answer: The following query reveals that there are 5 counties from Alaska along with Broomfield county are not 
present in both tables.
*/

SELECT
	ten.geo_name AS county,
	ten. state_us_abbreviation,
	twok.geo_name
FROM us_counties_2010 AS ten
LEFT JOIN us_counties_2000 AS twok
ON ten.state_fips = twok.state_fips
	AND ten.county_fips = twok.county_fips
WHERE twok.geo_name IS NULL;

-- Question 2: Using either the median() or precentile_cont() functions, determine the median of the percent change in county population.

SELECT
	PERCENTILE_CONT(.5) WITHIN GROUP (ORDER BY (ROUND((CAST(ten.p0010001 AS NUMERIC(8,1)) - twok.p0010001) / twok.p0010001 * 100, 1))) AS median_pop_change
FROM us_counties_2010 AS ten
JOIN us_counties_2000 AS twok
ON ten.state_fips = twok.state_fips
	AND ten.county_fips = twok.county_fips;

-- Question 3: Which county had the greates percentage loss of population between 2000 and 2010?

-- Answer: The following query shows that St. Bernard Parish had the greatese population loss.
SELECT c2010.geo_name AS County,
       c2010.state_us_abbreviation,
       c2010.p0010001 AS pop_2010,
       c2000.p0010001 AS pop_2000,
       c2010.p0010001 - c2000.p0010001 AS raw_change,
       round( (CAST(c2010.p0010001 AS DECIMAL(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 ) AS pct_change
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
ORDER BY pct_change ASC;