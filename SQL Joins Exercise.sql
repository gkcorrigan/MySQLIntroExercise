/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
SELECT categories.name AS 'Category Name', products.name AS 'Product Name'
FROM products 
INNER JOIN categories
ON products.CategoryID = categories.CategoryID
WHERE categories.NAME = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
LEFT JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- Easy Solution
SELECT sales.EmployeeID, employees.FirstName, employees.LastName, SUM(sales.Quantity)
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY sales.EmployeeID
ORDER BY SUM(sales.Quantity) DESC
LIMIT 1;
-- HARD Solution
SELECT sales.EmployeeID, employees.FirstName, employees.LastName, SUM(sales.Quantity)
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
HAVING SUM(sales.Quantity) = (
SELECT SUM(sales.Quantity) FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY SUM(sales.Quantity) DESC
LIMIT 1);
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS 'Department Name', categories.Name AS 'Category Name'
FROM departments
INNER JOIN categories 
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */
 -- FIRST ATTEMPT
-- SELECT products.Name AS 'Product Name', SUM(sales.Quantity) AS 'Total Copies Sold', SUM(sales.Quantity * products.Price) AS 'Total Price Sold'
-- FROM products
-- INNER JOIN sales
-- ON products.ProductID = sales.ProductID
-- WHERE products.Name = 'Eagles: Hotel California'
-- GROUP BY products.Name, sales.Quantity, products.Price;

SELECT products.ProductID, Name, SUM(Quantity), SUM( Quantity * PricePerUnit) 
FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.Name = 'Eagles: Hotel California'
GROUP BY sales.ProductID;

-- SELECT * FROM sales
-- WHERE ProductID = 97;


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT Name AS 'Product Name', Reviewer, Rating, Comment FROM reviews
INNER JOIN products
ON reviews.ProductID = products.ProductID
WHERE Name LIKE '%Visio%TV%' AND Rating =1;

-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT sales.EmployeeID, FirstName, LastName, Name, SUM(Quantity) FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products
ON sales.ProductID = products.ProductID
GROUP BY sales.EmployeeID, sales.ProductID
ORDER BY sales.EmployeeID, sales.ProductID;