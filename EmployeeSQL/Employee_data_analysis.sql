--Data analysis asks

--List the employee number, last name, first name, sex, and salary of each employee.
--Recommend limiting results to 50 (Add <LIMIT 50> before semicolon) otherwise PgAdmin breaks trying to run this many rows.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
--Recommend limiting results to 50 (Add <LIMIT 50> before semicolon) otherwise PgAdmin breaks trying to run this many rows.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01 00:00:00' AND hire_date < '1987-01-01 00:00:00';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT m.dept_no, d.dept_name,e.emp_no, e.last_name, e.first_name
FROM dept_manager m
LEFT JOIN employees e
ON m.emp_no = e.emp_no
LEFT JOIN departments d
ON m.dept_no = d.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--Recommend limiting results to 50 (Add <LIMIT 50> before semicolon) otherwise PgAdmin breaks trying to run this many rows.
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON de.emp_no = e.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
--Instructions did not specify to list (have a column) for department in the pull so it's not included.
--Recommend limiting results to 50 (Add <LIMIT 50> before semicolon) otherwise PgAdmin breaks trying to run this many rows.
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp de
LEFT JOIN employees e
ON de.emp_no = e.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--Recommend limiting results to 50 (Add <LIMIT 50> before semicolon) otherwise PgAdmin breaks trying to run this many rows.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON de.emp_no = e.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--Recommend limiting results to 50 (Add <LIMIT 50> before semicolon) otherwise PgAdmin breaks trying to run this many rows.
SELECT last_name, COUNT(*) AS last_name_count
FROM employees
GROUP BY last_name;


