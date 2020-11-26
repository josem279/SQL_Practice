-- Chapter 2: Beginning Data Exploration With Select
-- Challenge Queries


-- Write a query that lists the schools in alphabetical order along with teachers ordered by last name A-Z
SELECT school, first_name, last_name
FROM teachers
ORDER BY school, last_name;

-- Write a query that finds the one teacher whose first name starts with the letter S and who earns more that $40k --
SELECT *
FROM teachers
WHERE salary > 40000 AND
	first_name ILIKE 's%';
	
-- Rank teachers hired since Jan 1, 2010, ordered by highest paid to lowest --
SELECT *
FROM teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary DESC;