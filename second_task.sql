CREATE SCHEMA employee;
CREATE TABLE IF NOT EXISTS employee.employees (
	id SERIAL PRIMARY KEY, 
	name VARCHAR(255) NOT NULL,
	department VARCHAR(255) NOT NULL,
	boss INTEGER
	);