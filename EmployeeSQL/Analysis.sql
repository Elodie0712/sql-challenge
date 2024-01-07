--1.List the employee number, last name, first name, sex, and salary of each employee

--1st join employees table and salaries table
-- Perform an INNER JOIN on the two tables
SELECT employees.emp_no,employees.last_name,employees.first_name,employees.sex,salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;
--Alternative method
SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees as e
INNER JOIN salaries as s ON
s.emp_no=e.emp_no;


--2.List the first name, last name, and hire date for the employees who were hired in 1986

--Query
SELECT first_name,last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.

-- Perform an INNER JOIN on the two tables
SELECT dept_manager.dept_no,departments.dept_name,dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON departments.dept_no=dept_manager.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no;
--Alternative method
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
INNER JOIN departments as d ON d.dept_no = dm.dept_no
INNER JOIN employees as e ON e.emp_no = dm.emp_no;

---4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
-- Perform an INNER JOIN on the two tables
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no;
--Alternative method
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM de
INNER JOIN employees as e ON e.emp_no = de.emp_no
INNER JOIN departments as d ON d.dept_no = de.dept_no;
 
--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

--Query
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.

-- Perform an INNER JOIN on the three tables
SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales';
--Alternative method

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments as d
INNER JOIN dept_emp as de ON de.dept_no = d.dept_no
INNER JOIN employees as e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Perform an INNER JOIN on the three tables

SELECT  dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
INNER JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name IN ('Sales', 'Development');

--Alternative method

SELECT  de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
INNER JOIN dept_emp as de ON de.dept_no = d.dept_no
INNER JOIN employees as e ON e.emp_no = de.emp_no
WHERE d.dept_name IN ('Sales', 'Development');

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--Query
SELECT last_name, COUNT(last_name) AS "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY "last_name_count" DESC;



