--drop departments & employees tables last, others have dependent foreign keys
DROP TABLE IF EXISTS dept_manager; 
DROP TABLE IF EXISTS dept_emp; 
DROP TABLE IF EXISTS titles; 
DROP TABLE IF EXISTS salaries; 

DROP TABLE IF EXISTS employees; 
DROP TABLE IF EXISTS departments; 

-- setting up departments & employees tables first, no dependent foreign keys
CREATE TABLE departments (
	dept_no varchar(4) PRIMARY KEY NOT NULL
	, dept_name varchar(30)
); 

CREATE TABLE employees (
	emp_no int PRIMARY KEY NOT NULL
	, birth_date DATE
	, first_name varchar(30)
	, last_name varchar(30)
	, gender varchar(1)
	, hire_date DATE
); 


-- setting up tables with foreign keys
CREATE TABLE dept_emp (
	emp_no int NOT NULL
	, dept_no varchar(4)
	, from_date DATE
	, to_date DATE
	, FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	, FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
); 

CREATE TABLE dept_manager (
	dept_no varchar(4) NOT NULL
	, emp_no int NOT NULL
	, from_date DATE
	, to_date DATE
	, FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	, FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
); 

CREATE TABLE salaries (
	emp_no int NOT NULL
	, salary DECIMAL
	, from_date DATE
	, to_date DATE
	, FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
); 

CREATE TABLE titles (
	emp_no int NOT NULL
	, title varchar(30)
	, from_date DATE
	, to_date DATE
	, FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
); 

