-- Queries used during SQL practice with Company Schema --

-- BASIC QUERIES --
-- Finding all employees --
SELECT * FROM employee;

-- Finding all clients --
SELECT * FROM client;

-- Finding all employees ordered by salary descending --
SELECT * FROM employee
ORDER BY salary DESC;

-- Finding all employees ordered by sex then name --
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;

-- Finding the 5 employees from the table --
SELECT *
FROM employee
LIMIT(5);

-- Find the first and last names of all employees --
SELECT first_name, last_name
FROM employee;

/* Find the first and last names of all employees and change
column headings to 'Forename' and 'Surname' */
SELECT first_name AS forename, last_name AS surname
FROM employee;

-- Find out all the different genders in employee table --
SELECT DISTINCT sex
FROM employee;


-- FUNCTIONS --
-- Find the number of employees --
SELECT COUNT(first_name) AS number_of_employees
FROM employee;
-- Find how many employees have supervisors --
SELECT COUNT(super_id) AS emps_with_supervisors
FROM employee;
-- Find the number of female employees born after 1970 --
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_date > '1970-01-01';




