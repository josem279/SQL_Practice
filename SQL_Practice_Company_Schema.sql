CREATE TABLE employee (
	emp_id INT NOT NULL,
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	birth_date DATE NOT NULL,
	sex VARCHAR(1) NOT NULL,
	salary INT NOT NULL,
	super_id INT,
	branch_id INT NOT NULL,
	PRIMARY KEY(emp_id)
);

CREATE TABLE branch (
	branch_id SERIAL,
	branch_name VARCHAR(15) NOT NULL,
	mgr_id INT NOT NULL,
	mgr_start_date DATE NOT NULL,
	PRIMARY KEY(branch_id)
);

CREATE TABLE works_with (
	emp_id INT NOT NULL,
	client_id INT NOT NULL,
	total_sales BIGINT NOT NULL,
	PRIMARY KEY(emp_id, client_id)
);

CREATE TABLE client (
	client_id INT NOT NULL,
	client_name VARCHAR(30) NOT NULL,
	branch_id INT NOT NULL,
	PRIMARY KEY(client_id)
);

CREATE TABLE branch_supplier (
	branch_id INT NOT NULL,
	supplier_name VARCHAR(25) NOT NULL,
	supply_type VARCHAR(25) NOT NULL,
	PRIMARY KEY(branch_id, supplier_name)
);

INSERT INTO employee (emp_id, first_name, last_name, birth_date, sex, salary, branch_id)
VALUES (100, 'David', 'Wallace', '1967-11-17', 'M', 250000, 1);
INSERT INTO employee
VALUES (101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);
INSERT INTO employee
VALUES (102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, 2);
INSERT INTO employee
VALUES (103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee
VALUES (104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee
VALUES (105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);
INSERT INTO employee
VALUES (106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, 3);
INSERT INTO employee
VALUES (107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 100, 3);
INSERT INTO employee
VALUES (108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 100, 3);

INSERT INTO branch (branch_name, mgr_id, mgr_start_date)
VALUES ('Corporate', 100, '2006-02-09');
INSERT INTO branch (branch_name, mgr_id, mgr_start_date)
VALUES ('Scranton', 102, '1992-04-06');
INSERT INTO branch (branch_name, mgr_id, mgr_start_date)
VALUES ('Stamford', 106, '1998-02-13');

INSERT INTO works_with
VALUES(105, 400, 55000);
INSERT INTO works_with
VALUES(102, 401, 267000);
INSERT INTO works_with
VALUES(108, 402, 22500);
INSERT INTO works_with
VALUES(107, 403, 5000);
INSERT INTO works_with
VALUES(108, 403, 12000);
INSERT INTO works_with
VALUES(105, 404, 33000);
INSERT INTO works_with
VALUES(107, 405, 26000);
INSERT INTO works_with
VALUES(102, 406, 15000);
INSERT INTO works_with
VALUES(105, 406, 130000);

INSERT INTO client
VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client
VALUES(401, 'Lackawana Country', 2);
INSERT INTO client
VALUES(402, 'FedEx', 3);
INSERT INTO client
VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client
VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client
VALUES(405, 'Times Newspaper', 3);
INSERT INTO client
VALUES(406, 'FedEx', 2);

INSERT INTO branch_supplier
VALUES (2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier
VALUES (2, 'Uni-Ball', 'Writing Utensils');
INSERT INTO branch_supplier
VALUES (3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier
VALUES (2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier
VALUES (3, 'Uni-Ball', 'Writing Utensils');
INSERT INTO branch_supplier
VALUES (3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier
VALUES (3, 'Stamford Labels', 'Custom Forms');



