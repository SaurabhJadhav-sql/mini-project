-- ==========================================
-- Employee Management System
-- Database: PostgreSQL
-- ==========================================

-- Create Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Create Jobs Table
CREATE TABLE jobs (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50),
    min_salary INT,
    max_salary INT
);

-- Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    job_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

-- ==========================================
-- Insert Data into Departments
-- ==========================================

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

-- ==========================================
-- Insert Data into Jobs
-- ==========================================

INSERT INTO jobs VALUES
(1, 'Software Developer', 40000, 100000),
(2, 'HR Manager', 30000, 80000),
(3, 'Accountant', 35000, 90000);
(4, 'Data Analyst', 35000, 85000);
(5, 'Backend Developer', 50000, 120000);
(6, 'Frontend Developer', 40000, 95000);
(7,'DevOps Engineer', 60000, 130000);
(8, 'QA Engineer', 30000, 70000);

-- ==========================================
-- Insert Data into Employees
-- ==========================================

INSERT INTO employees VALUES
(1, 'Amit', 75000, 1, 1, '2022-01-15'),
(2, 'Priya', 60000, 2, 2, '2021-06-10'),
(3, 'Rahul', 85000, 1, 1, '2020-03-20'),
(4, 'Sneha', 50000, 3, 3, '2023-02-05');
(5, 'Rohit', Null , 1, 1, '2022-07-10');
(6, 'Neha', 70000, Null, 2, '2021-09-15');
(7, 'Karan' , 65000, 1, Null , Null);

-- ==========================================
-- Show employees with their department name
-- ==========================================

SELECT e.name,
       d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- ==========================================
-- Show employees with job title
-- ==========================================

SELECT e.name,
       j.job_title,
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id;

-- ==========================================
-- Average salary per department
-- ==========================================

SELECT d.department_name,
       AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- ==========================================
-- Highest paid employee
-- ==========================================

SELECT name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

=====================================================
-- 1️⃣ Employees hired after 2021
-- =====================================================

SELECT name, hire_date
FROM employees
WHERE hire_date >= '2022-01-01';



-- =====================================================
-- 2️⃣ Department name and total salary per department
-- =====================================================

SELECT 
    d.department_name,
    SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d 
    ON e.department_id = d.department_id
GROUP BY d.department_name;



-- =====================================================
-- 3️⃣ Second highest salary in the company
-- =====================================================

SELECT MAX(salary) AS second_max_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary) 
    FROM employees
);



-- =====================================================
-- 4️⃣ Employee(s) earning the second highest salary
-- =====================================================

SELECT name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary) 
        FROM employees
    )
);

-- =====================================================
-- 5️⃣ Create a View for Complete Employee Details
-- =====================================================

CREATE VIEW employees_details AS
SELECT 
    e.name,
    d.department_name,
    j.job_title,
    e.salary,
    e.hire_date
FROM employees e
JOIN departments d 
    ON e.department_id = d.department_id
JOIN jobs j 
    ON e.job_id = j.job_id;



-- =====================================================
-- 6️⃣ Query the View
-- =====================================================

SELECT * FROM employees_details;

-- =======================================================
-- 7️⃣ Show Employees Without Department.
--=======================================================

Select Employee_id,Name
From Employees
Where Department_id is null;

-- ======================================================
-- 8️⃣ Replace Null Values
-- =====================================================

Select Name,Coalesce(Salary,0) As Salary
From Employees

-- ======================================================
-- 9️⃣ Employees With Department Names(Left Join)
-- ======================================================

Select E.Name,D.Department_Name 
From Employees E Left Join Departments D
On E.Department_id = D.Department_id;

-- ================================================================
-- 🔟 Rank all employees based on their salary in descending order
-- ================================================================

Select Name,
Dense_Rank() Over(Order by Salary Desc) As rnk
From Employees;

-- =================================================================
-- 11) Rank Employees within each department based on salary
-- =================================================================

Select e.Name,d.Department_name,e.Salary,
Rank() Over(Partition by D.Department_Name Order by E.Salary Desc) AS Dept_rnk
From Employees E Join Departments D 
On E.Department_id = D.Department_id;

-- ==================================================================
-- 12) Find all employees  whose salary is not assigned.
-- ==================================================================

Select * From Employees 
Where Salary is Null;

-- ===========================================================================
-- 13) Display employee Name,department,salary,And rank within each department
-- ===========================================================================

Select * From 
(Select E.Name,D.Department_Name,E.Salary,Rank()
Over(Partition by D.Department_Name Order by E.Salary Desc) As Rnk
From Employees E Left Join Departments D 
On E.Department_id = D.Department_id)t
Where rnk = 1;

