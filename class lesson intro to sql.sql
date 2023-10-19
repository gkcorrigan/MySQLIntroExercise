USE bestbuy;

SELECT EmployeeID, FirstName, EmailAddress FROM employees;
SELECT ProductID, Price, OnSale FROM products;

SELECT * FROM departments;
-- INSERT INTO table_name (column1, column2, column3, ...) VALUES (value 1, value 2, value 3, ...)
INSERT INTO departments (Name) VALUES ('Plants');


-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condition;

UPDATE departments
SET Name = 'Paper'
WHERE DepartmentID =5;

-- DELETE FROM table_name
-- WHERE condition;
DELETE FROM departments
WHERE DepartmentID =5;


SELECT ProductID, Name, Price FROM products WHERE Price < 600 AND Price > 10;
