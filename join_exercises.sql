DROP DATABASE IF EXISTS join_test_db;
CREATE DATABASE IF NOT EXISTS join_test_db;
USE join_test_db;


CREATE TABLE roles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id)
 VALUES
    ('bob', 'bob@example.com', 1),
    ('joe', 'joe@example.com', 2),
    ('sally', 'sally@example.com', 3),
    ('adam', 'adam@example.com', 3),
    ('jane', 'jane@example.com', null),
    ('mike', 'mike@example.com', null);


SELECT * FROM users;
SELECT * FROM roles;

SELECT *
FROM users u
-- Join roles r ON u.role_id = r.id;
RIGHT JOIN roles r ON r.id = u.role_id;

SELECT *
FROM roles r
LEFT JOIN users u ON u.role_id = r.id;

SELECT
       r.name AS role_name,
       COUNT(*) AS count_all,
       COUNT(u.id) AS count_users
FROM roles r
LEFT JOIN users u ON u.role_id = r.id
GROUP BY r.name;




-- employees database
USE employees;

-- Write a query that shows each department along with the name of the current manager for that department.

SELECT dept_name, concat(first_name, " ", last_name) AS "Current Manager"
FROM departments d
JOIN dept_manager dm ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date > NOW();



-- Find the name of all departments currently managed by women.
-- employees table to get names and gender
-- dept_managers table to get managers
-- department name
SELECT dept_name AS 'Department Name',
       concat(first_name, ' ', last_name) AS  'Manager Name'
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
AND gender = 'F'
ORDER BY "Department Name";



-- Find the current titles of employees currently working in the Customer Service department.
-- Titles table to get the titles
-- Department table to get department names.
SELECT title AS "Title",
       count(*) AS "Count"
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN titles ON titles.emp_no = dept_emp.emp_no
WHERE titles.to_date > CURDATE()
AND dept_emp.to_date > curdate()
AND dept_name = 'Customer Service'
GROUP BY title;




-- Find the current salary of all current managers.
-- departments table to get department
-- employees table to get employee names
-- salaries table to get salaries
-- dept_manager table to link manager emp_no to there dept_no

SELECT dept_name AS 'Department Name',
       concat(first_name, " ", last_name) AS 'Department Manager',
       salary AS 'Salary'
FROM salaries
JOIN dept_manager ON dept_manager.emp_no = salaries.emp_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE salaries.to_date > CURDATE()
AND dept_manager.to_date > CURDATE()
ORDER BY 'Department Name';
