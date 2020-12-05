-- Chapter 5: Basic Math And Stats With SQL
-- Challenge Questions


-- Question 1: Write a SQL statement for calculating the area of a circle whose radius is 5 inches. Do you need parenthese in your calculation? Why or why not?

SELECT 3.14 * (5 ^ 2);

/* Answer : In this case we do not need parentheses as order of operations will give exponents priority over multiplication. However, parentheses may help make the expression easier to
understand. */ 

/*
Question 2: Using the  2010 Census county data, find out which New York state county has the highest percentage of the population that identified as "American 
Indian/Alaska Native Alone".
*/

SELECT geo_name AS County,
	state_us_abbreviation,
	p0010001 AS total_population,
	p0010005 AS american_indian_alaska_native_alone,
	(CAST(p0010005 AS NUMERIC(8,1)) / p0010001) * 100 AS Pct_American_Indian
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY'
ORDER BY Pct_American_Indian DESC
LIMIT 1;

-- Question 3: Was the 2010 median county population higher in California or New York
SELECT state_us_abbreviation AS "State",
       percentile_cont(0.5)
	   WITHIN GROUP (ORDER BY p0010001) AS "Median"
FROM us_counties_2010
WHERE state_us_abbreviation IN ('NY', 'CA')
GROUP BY state_us_abbreviation;

/* Answer: Based on the output from the query above, California had a higher median county population than New York - 179,140.5 to 91,301 respectively.

