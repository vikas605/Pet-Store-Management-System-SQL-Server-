USE PetShopDB;
CREATE TABLE Customers(
customer_id INT PRIMARY KEY IDENTITY(1,1),
customer_name VARCHAR(100),
phone VARCHAR(15),
city VARCHAR(50),
);

SELECT * FROM customers;
DESC Customers;
sp_help Customers;

INSERT INTO Customers(customer_name,phone,city) VALUES
('Vikas Gaikwad','9876543214','Pune'),
('Rohan Deshmukh','9876543215','Nashik'),
('Anjali Kulkarni','9876543216','Kolhapur'),
('Karan Singh','9876543217','Bangalore'),
('Neha Gupta','9876543218','Hyderabad'),
('Suresh Yadav','9876543219','Chennai'),
('Pooja Mehta','9876543220','Ahmedabad'),
('Arjun Patel','9876543221','Surat'),
('Meera Shah','9876543222','Jaipur'),
('Akash Kumar','9876543223','Indore');
select * from Customers;


USE PetShopDB;
CREATE TABLE Pets(
pet_id INT PRIMARY KEY IDENTITY(1,1),
pet_name VARCHAR(100),
pet_type VARCHAR(50),
breed VARCHAR(50),
age INT,
price DECIMAL(10,2)
);
SELECT *FROM Pets;

INSERT INTO Pets (pet_name,pet_type,breed,age,price) VALUES
('Max','Dog','Pug',2,12000),
('Kitty','Cat','Siamese',1,9000),
('Coco','Bird','Cockatiel',2,3500),
('Charlie','Dog','Beagle',3,18000),
('Bunny','Rabbit','Dutch Rabbit',1,4500),
('Leo','Dog','Golden Retriever',2,22000),
('Simba','Cat','Maine Coon',2,15000),
('Tweety','Bird','Canary',1,2500),
('Jack','Dog','Rottweiler',4,30000),
('Daisy','Rabbit','Lionhead',1,5500);

SELECT * FROM Pets;

CREATE TABLE employee(
emp_id INT PRIMARY KEY IDENTITY(1,1),
emp_name VARCHAR(100),
designation VARCHAR(50),
salary INT 
);


SELECT * FROM employee;
INSERT INTO employee
(emp_name, designation, salary)
VALUES
('Priya','HR Executive',30000),
('Amit','Accountant',28000),
('Sneha','Receptionist',20000),
('Rahul','Store Supervisor',32000),
('Neha','Marketing Executive',27000),
('Vikas','Sales Executive',26000),
('Anjali','Customer Support',24000),
('Akash','Store Manager',38000),
('Pooja','Data Entry Operator',21000),
('Rohit','Inventory Executive',29000);

SELECT * FROM employee;
SELECT * FROM Pets;
SELECT * FROM Customers;

CREATE TABLE orders(
order_id INT PRIMARY KEY IDENTITY(1,1),
customer_id INT ,
order_date DATE,
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id)
);


INSERT INTO orders (customer_id,order_date) VALUES
(1,'2026-05-16'),
(2,'2026-05-16'),
(3,'2026-05-17'),
(4,'2026-05-17'),
(5,'2026-05-18'),
(6,'2026-05-18'),
(7,'2026-05-19'),
(8,'2026-05-19'),
(9,'2026-05-20'),
(10,'2026-05-20');


CREATE TABLE OrderDetails(
    detail_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    pet_id INT,
    quantity INT,

    FOREIGN KEY(order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY(pet_id)
    REFERENCES Pets(pet_id)
);


SELECT * FROM employee;
SELECT * FROM Pets;
SELECT * FROM Customers;
SELECT * FROM orders;





INSERT INTO OrderDetails
(order_id, pet_id, quantity)
VALUES
(1,1,1),
(2,2,1),
(3,3,2),
(4,4,1),
(5,5,1),
(6,6,2),
(7,7,1),
(8,8,3),
(9,9,1),
(10,10,2);

SELECT *FROM Pets
WHERE pet_type ='Dog';

SELECT *  FROM Pets
ORDER BY price DESC;

SELECT COUNT(*) AS TotalPets
FROM Pets;

SELECT AVG(salary) AS AvgSalary
FROM employee;

SELECT COUNT(*) AS TotalSalary 
FROM employee;


SELECT SUM(salary) SumOfSalary
FROM employee;

SELECT  TOP 3 *
FROM Pets
ORDER BY price DESC;


ALTER TABLE employee
Add manager_id INT;
INSERT INTO manager_id VALUES 
SELECT * FROM employee;

ALTER TABLE employee
DROP COLUMN manager_id;

UPDATE employee SET manager_id = NULL WHERE emp_id = 1; -- Priya
UPDATE employee SET manager_id = 1 WHERE emp_id = 2; -- Amit
UPDATE employee SET manager_id = 1 WHERE emp_id = 3; -- Sneha
UPDATE employee SET manager_id = 1 WHERE emp_id = 4; -- Rahul
UPDATE employee SET manager_id = 2 WHERE emp_id = 5; -- Neha
UPDATE employee SET manager_id = 2 WHERE emp_id = 6; -- Vikas
UPDATE employee SET manager_id = 4 WHERE emp_id = 7; -- Anjali
UPDATE employee SET manager_id = 4 WHERE emp_id = 8; -- Akash
UPDATE employee SET manager_id = 4 WHERE emp_id = 9; -- Pooja
UPDATE employee SET manager_id = 4 WHERE emp_id = 10; -- Rohit

SELECT 
    e.emp_id,
    e.emp_name AS Employee,
    e.designation,
    m.emp_name AS Manager
FROM employee e
LEFT JOIN employee m
ON e.manager_id = m.emp_id;


SELECT emp_name, salary*12  As sal ,salary+salary*34/100m AS total salary 
FROM employee;

SELECT 
    emp_name,
    salary * 12 AS sal,
    (salary * 12) + ((salary * 12) * 34 / 100) AS total_salary
FROM employee;


select avg(salary) as avg_salary
FROM employee;


SELECT TOP 1 Salary
FROM (
SELECT DISTINCT TOP 2 Salary
FROM employee
ORDER BY salary Desc
 ) X
 ORDER BY salary;


 SELECT TOP 1 salary 
 FROM employee
 ORDER BY  salary  DESC;


 SELECT * FROM employee;
SELECT * FROM Pets;
SELECT * FROM Customers;
SELECT * FROM orders;





ALTER TABLE orders
ADD pet_id INT ,
emp_id INT;

UPDATE orders
SET pet_id = 1,
    emp_id = 2
WHERE order_id = 1;

SELECT * FROM orders; 
UPDATE orders
SET pet_id = 2,
    emp_id = 4
WHERE order_id = 2;

UPDATE orders
SET pet_id = 3,
    emp_id = 1
WHERE order_id = 3;

UPDATE orders
SET pet_id = 4,
    emp_id = 3
WHERE order_id = 4;

UPDATE orders
SET pet_id = 5,
    emp_id = 2
WHERE order_id = 5;

UPDATE orders
SET pet_id = 6,
    emp_id = 4
WHERE order_id = 6;

UPDATE orders
SET pet_id = 7,
    emp_id = 1
WHERE order_id = 7;

UPDATE orders
SET pet_id = 8,
    emp_id = 3
WHERE order_id = 8;

UPDATE orders
SET pet_id = 9,
    emp_id = 2
WHERE order_id = 9;

UPDATE orders
SET pet_id = 10,
    emp_id = 4
WHERE order_id = 10;


SELECT * FROM orders;

ALTER TABLE orders
ADD CONSTRAINT fk_pet
FOREIGN KEY (pet_id)
REFERENCES pets(pet_id);


ALTER TABLE orders
ADD CONSTRAINT FK_employee
FOREIGN KEY (emp_id)
REFERENCES employee(emp_id);

--FULL ORDER REPORT --
SELECT 
    o.order_id,
    c.customer_name,
    p.pet_name,
    e.emp_name,
    o.order_date
FROM orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
JOIN Pets p
    ON o.pet_id = p.pet_id
JOIN employee e
    ON o.emp_id = e.emp_id;

  -- Total orders handled by each employee

  SELECT
    e.emp_name,
    COUNT(o.order_id) AS total_orders
FROM employee e
LEFT JOIN orders o
ON e.emp_id = o.emp_id
GROUP BY e.emp_name;


--Customer with most orders

SELECT TOP 1
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC;


--Employees with salary above average

SELECT emp_name, salary
FROM employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);

--Nth highest salary (interview favorite)

SELECT salary
FROM
(
    SELECT salary,
           DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
    FROM employee
) x
WHERE rnk = 3;

---Employee who handled the most orders
SELECT TOP 1
    e.emp_name,
    COUNT(o.order_id) AS total_orders
FROM employee e
JOIN orders o
ON e.emp_id = o.emp_id
GROUP BY e.emp_name
ORDER BY total_orders DESC;

--Employees with no orders

SELECT e.emp_name
FROM employee e
LEFT JOIN orders o
ON e.emp_id = o.emp_id
WHERE o.order_id IS NULL;

--Employees with no orders

SELECT e.emp_name
FROM employee e
LEFT JOIN orders o
ON e.emp_id = o.emp_id
WHERE o.order_id IS NULL;
---Order count by date
SELECT
    order_date,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_date;

--Add a row number to employees by salary
SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employee;

--Running total of salaries
SELECT
    emp_name,
    salary,
    SUM(salary) OVER(ORDER BY emp_id) AS running_total
FROM employee;

--2nd highest salary
SELECT salary
FROM 
(
SELECT salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
FROM employee
)X
WHERE rnk = 2;

--Employees earning more than their manager 


SELECT 
e.emp_name  AS employee,
m.emp_name  AS Manager ,
e.salary
FROM employee e
JOIN employee m
ON e.manager_id =m.emp_id
WHERE e.salary > m.salary ;

--Find duplicate salaries

SELECT salary, COUNT(*) AS total
FROM employee
GROUP BY salary
HAVING COUNT(*)  > 1;
 -- FOR I NEED SAME SALARIES FOR 2 TIMES I HAVE ADDED THIS QUERY 
UPDATE employee
SET salary = 21000
WHERE emp_id = 1;

SELECT * 
from employee ;

--Highest salary in each designation 

SELECT designation,MAX (salary) AS Highest_salary 
FROM employee
GROUP BY designation;


SELECT * FROM employee;
SELECT * FROM Pets;
SELECT * FROM Customers;
SELECT * FROM orders;


--Employees whose name starts with A
SELECT * 
FROM employee
WHERE emp_name LIKE 'A%';
--Employees whose name ENDS  with A 
SELECT * 
FROM employee
WHERE emp_name LIKE '%A';


--Employees whose salary is between 25000 and 30000 
SELECT *
FROM employee
WHERE salary between 25000 AND 30000;

--Count employees by designation
SELECT designation ,COUNT(*) AS TOTAL_EMPLOYEES 
FROM employee
GROUP BY designation ;


--CREATE A VIEW 
CREATE VIEW employee_details AS
SELECT emp_name, designation, salary
FROM employee;

SELECT * FROM employee_details;

--1. CTE (Common Table Expression)

WITH avg_emp AS
(
    SELECT emp_name, salary
    FROM employee
)
SELECT *
FROM avg_emp
WHERE salary >
(
    SELECT AVG(salary)
    FROM employee
);

--Recursive CTE (Useful for manager hierarchy)
WITH emp_hierarchy AS
(
    SELECT emp_id, emp_name, manager_id
    FROM employee
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id,
           e.emp_name,
           e.manager_id
    FROM employee e
    JOIN emp_hierarchy h
    ON e.manager_id = h.emp_id
)
SELECT * 
FROM emp_hierarchy;

--Stored Procedure Get employee details by ID:

CREATE PROCEDURE GetEmployee
    @id INT
AS
BEGIN
    SELECT *
    FROM employee
    WHERE emp_id = @id
END;

EXEC GetEmployee 3;

--Trigger Log salary updates:

CREATE TRIGGER trg_salary_update
ON employee
AFTER UPDATE
AS
BEGIN
    PRINT 'Salary updated'
END;

-- HERE I HAVE UPDATED ONE EMPLOYEE SALARY FOR  CHECKING I USED TRIGGER TO SHOW SALARY WAS UPDATED RIGHT NOW 
UPDATE  employee
SET salary  = 60000
WHERE emp_id = 2;

UPDATE employee
SET emp_name = 'Rahul'
WHERE emp_id = 2;

--because the trigger says AFTER UPDATE on the whole table.  If you want it only when salary changes, use:

CREATE TRIGGER trigger_salary_update
ON employee
AFTER UPDATE
AS
BEGIN
    IF UPDATE(salary)
    BEGIN
        PRINT 'Salary updated'
    END
END;
--You did not need a second trigger. You needed to modify the first trigger:
ALTER TRIGGER trigger3_salary_update
ON employee
AFTER UPDATE
AS
BEGIN
    IF UPDATE(salary)
    BEGIN
        PRINT 'Salary updated'
    END
END;

DROP TRIGGER trg_salary_update;

CREATE TRIGGER trg_salary_update
ON employee
AFTER UPDATE
AS
BEGIN
    IF UPDATE(salary)
    BEGIN
        PRINT 'Salary updated'
    END
END;

UPDATE employee
SET salary = 60000
WHERE emp_id = 2;
UPDATE employee
SET emp_name = 'Rahul'
WHERE emp_id = 2;

SELECT name
FROM sys.triggers;

DROP TRIGGER trigger_salary_update;

UPDATE employee
SET emp_name='Rahul'
WHERE emp_id=2;

UPDATE employee
SET emp_name='Rahul'
WHERE emp_id=3;

--Transaction

BEGIN TRANSACTION

UPDATE employee
SET salary = salary + 1000
WHERE emp_id = 1;

ROLLBACK;

COMMIT;

BEGIN TRANSACTION;

UPDATE employee
SET salary = salary + 1000
WHERE emp_id = 1;

ROLLBACK TRANSACTION;

BEGIN TRANSACTION;

UPDATE employee
SET salary = salary + 1000
WHERE emp_id = 1;

COMMIT TRANSACTION;

--Temporary table

SELECT *
INTO #temp_employee
FROM employee;

SELECT * FROM #temp_employee;

SELECT * FROM employee;
SELECT * FROM Pets;
SELECT * FROM Customers;
SELECT * FROM orders;