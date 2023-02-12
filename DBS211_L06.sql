/*
Name:Shayan Chabook
StudentID: 159844208
date: 3/8/2022
DBS211-Lab06
*/

SET AUTOCOMMIT ON;

--1.Display the data for all offices.
SELECT * FROM offices;

--2.Display the employee number for all employees whose office code is 1.
SELECT employeenumber FROM employees where officecode = 1; 

--3.Display customer number, customer name, contact first name and contact last name,
--and phone for all customers in Paris. (hint: be wary of case sensitivity)
SELECT 
customernumber,
customername,
contactfirstname,
contactlastname,
phone
FROM customers WHERE city = 'Paris';

--4.Repeat the previous Query with a couple small changes:
SELECT
customernumber,
customername,
contactfirstname || ' ' || contactlastname as "lastname, firstname",
phone
FROM customers WHERE country = 'Canada';

--5.Display customer number for customers who have payments. Do not included 
--values any repeated 
SELECT DISTINCT customernumber FROM payments WHERE amount > 0;

--6.List customer numbers, check number, and amount for customers whose
--payment amount is not in the range of $30,000 to $65,000. Sort the 
--output by top payments amount first.
SELECT 
customernumber,
checknumber
FROM payments WHERE 30000 > amount OR amount > 65000;

--7.Display the order information for all orders that are cancelled. 
SELECT * FROM orders WHERE status = 'Cancelled';

--8.The company needs to know the percentage markup for each product sold. 
--Produce a query that outputs the ProductCode, ProductName, BuyPrice, MSRP
--in addition to

SELECT 
productcode,
productname,
buyprice,
msrp,
msrp - buyprice AS markup,
100 * (msrp - buyprice) / buyprice AS percmarkup
FROM products;

--9.Display the information of all products with string ‘co’ in their product
--name. (c and o can be lower or upper case).
SELECT * FROM products WHERE productname like '%co%';


--10.Display all customers whose contact first name starts with letter s
--(both lowercase and uppercase) and includes letter e (both lowercase and uppercase).
SELECT * FROM customers WHERE contactfirstname LIKE 'S%e%';

--11.Create a statement that will insert yourself as an employee of the company. 
INSERT INTO employees 
VALUES('8976', 'Chabook', 'Shayan', 'x234', 'schabook@myseneca.ca', '4', '1088',
'Cashier');

--12.Create a query that displays your, and only your, employee data
SELECT * FROM employees WHERE email = 'schabook@myseneca.ca';

--13.Create a statement to update your job title to “Head Cashier”
UPDATE employees
SET jobtitle = 'Head Cashier'
WHERE email = 'schabook@myseneca.ca';

--14.Create a statement to insert another fictional employee into the database.
INSERT INTO employees 
VALUES('3212', 'Ma', 'Eric', 'x321', 'ericma@gmail.com', '7', '8976', 'cashier');

--15.Create a statement to Delete yourself from the database. 
--Did it work?  If not, why?
DELETE FROM employees WHERE firstname = 'Shayan';
--I could not delete my information as another row is relying on my data.

--16.Create a statement to delete the fake employee from the database and then
--rerun the statement to delete yourself.  Did it work?
DELETE FROM employees WHERE firstname = 'Eric';
DELETE FROM employees WHERE firstname = 'Shayan';
--yes, it worked.

--17.Create a single statement that will insert both yourself and the fake 
--employee at the same time
INSERT ALL
INTO employees VALUES ('8976', 'Chabook', 'Shayan', 'x234', 'schabook@myseneca.ca', '4', '1088',
'Cashier')
INTO employees VALUES ('3212', 'Ma', 'Eric', 'x321', 'ericma@gmail.com', '7', '1088', 'cashier')
SELECT * FROM dual;
--Create a single statement to delete both yourself and the fake employee.
DELETE FROM employees WHERE employeenumber = '8976' AND employeenumber = '3212';
