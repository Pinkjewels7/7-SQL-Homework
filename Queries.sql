-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	e.emp_no
	, e.last_name
	, e.first_name
	, e.gender
	, s.salary
FROM salaries s
JOIN employees e 
	ON e.emp_no = s.emp_no
JOIN titles t 
	ON t.emp_no = s.emp_no
	AND t.from_date = s.from_date
ORDER BY e.emp_no; 

-- List employees who were hired in 1986.
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' 
	AND '1986-12-31';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT 
	d.dept_no
	, d.dept_name
	, m.emp_no
	, e.last_name
	, e.first_name
	, m.from_date
	, m.to_date
FROM departments d
JOIN dept_manager m 
	ON m.dept_no = d.dept_no
JOIN employees e 
	ON e.emp_no = m.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT 
	e.emp_no
	, e.last_name
	, e.first_name
	, dp.dept_name
FROM employees e 
JOIN dept_emp d 
	ON e.emp_no = d.emp_no 
JOIN departments dp 
	ON d.dept_no = dp.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE LOWER(first_name) LIKE ('hercules')
	AND LOWER(last_name) LIKE ('b%');

-- List all employees in the Sales department, including: 
-- employee number, last name, first name, and department name.
SELECT 
	e.emp_no
	, e.last_name
	, e.first_name
	, dp.dept_name
FROM employees e 
JOIN dept_emp de
	ON e.emp_no = de.emp_no 
JOIN departments dp 
	ON dp.dept_no = de.dept_no 
WHERE LOWER(dp.dept_name) LIKE ('sales'); 

-- List all employees in the Sales and Development departments, including: 
-- employee number, last name, first name, and department name.
SELECT 
	e.emp_no
	, e.last_name
	, e.first_name
	, dp.dept_name
FROM employees e
JOIN dept_emp de 
	ON e.emp_no = de.emp_no
JOIN departments dp 
	ON dp.dept_no = de.dept_no
WHERE LOWER(dp.dept_name) LIKE ('development') 
	OR LOWER(dp.dept_name) LIKE ('sales');

-- In descending order, list the frequency count of employee last names
SELECT 
	last_name
	, COUNT(*) frequency_count
FROM employees
GROUP BY last_name
ORDER BY 
	frequency_count DESC
	, last_name ASC; 