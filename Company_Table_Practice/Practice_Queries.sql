-- Queries used during SQL practice with Company Schema

-- BASIC QUERIES
-- Finding all employees
SELECT * FROM employee;
-- Finding all clients
SELECT * FROM client;
-- Finding all employees ordered by salary descending
SELECT * FROM employee
ORDER BY salary DESC;
-- Finding all employees ordered by sex then name
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;
-- Finding the 5 employees from the table
SELECT *
FROM employee
LIMIT(5);
-- Find the first and last names of all employees
SELECT first_name, last_name
FROM employee;
/* Find the first and last names of all employees and change
column headings to 'Forename' and 'Surname' */
SELECT first_name AS forename, last_name AS surname
FROM employee;
-- Find out all the different genders in employee table
SELECT DISTINCT sex
FROM employee;



-- FUNCTIONS
-- Find the number of employees
SELECT COUNT(first_name) AS number_of_employees
FROM employee;
-- Find how many employees have supervisors
SELECT COUNT(super_id) AS emps_with_supervisors
FROM employee;
-- Find the number of female employees born after 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_date > '1970-01-01';
-- Find the average of all employee's salaries
SELECT AVG(salary)
FROM employee;
-- Find the sum of all male employee's salaries
SELECT AVG(salary)
FROM employee
WHERE sex = 'M';
-- Find out how many males and females there are
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;
-- Find the total sales of each salesperson
SELECT emp.emp_id, emp.first_name, emp.last_name, ww.total_sales
FROM employee AS emp
JOIN works_with as ww
ON emp.emp_id = ww.emp_id;


-- WILDCARDS AND THE LIKE AND ILIKE KEYWORDS
-- % = Any number of characters; _ = One character
-- Find any clients who are an LLC
SELECT *
FROM client
WHERE client_name LIKE '%LLC';
-- Find any branch suppliers who are in the label business
SELECT *
FROM branch_supplier
WHERE supplier_name ILIKE '%label%';
-- Find any employee born in October
SELECT *
FROM employee
WHERE TO_CHAR(birth_date, 'YYYY-MM-DD') LIKE '%-10%';
-- Find any clients who are schools
SELECT *
FROM client
WHERE client_name ILIKE '%school%';

-- UNIONS IN SQL
-- Create a list of employee and branch names
SELECT first_name
FROM employee
UNION
SELECT branch_name
FROM branch;
-- Create a list of 
SELECT client_name, branch_id
FROM client
UNION
SELECT supplier_name, branch_id
FROM branch_supplier;
-- Find a list of all money spent or earned by the company
SELECT total_sales
FROM works_with
UNION
SELECT -salary
FROM employee;


-- SQL JOINS
-- Find all branches and the names of their managers
SELECT employee.emp_id, employee.first_name, employee.last_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

-- NESTED QUERIES
/* Find the names of all salespeople hwo have sold over 30000
to a single client */
SELECT emp.first_name, emp.last_name
FROM employee AS emp
WHERE emp.emp_id IN(
	SELECT ww.emp_id
	FROM works_with AS ww
	WHERE total_sales > 30000
);

/* Find all clients who are handled by the branch that Michael
Scott manages; assume you know Michael's employee ID */
SELECT client.client_name
FROM client
WHERE client.branch_id  = (
	SELECT emp.branch_id
	FROM employee AS emp
	WHERE emp.emp_id = 102
	LIMIT 1
);





