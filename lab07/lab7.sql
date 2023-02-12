--Shayan Chabook
--3/23/2022
--schabook@myseneca.ca
--159844208

--Create a query that shows employee number, first name, last name, city,
--phone number and postal code for all employees in France.
SELECT 
employeenumber, 
firstname,
lastname, 
city,
phone,
postalcode
FROM employees e JOIN customers c ON e.employeenumber = c.salesrepemployeenumber
WHERE country = 'France';

--ANSI-89 
SELECT emp.employeenumber, emp.firstname, emp.lastname, ofi.city, ofi.phone,
ofi.postalcode 
FROM employees emp , offices ofi
WHERE emp.officecode = ofi.officecode
AND ofi.country = 'France';

--Create a query that displays all payments made by customers from Canada.  
SELECT 
c.customernumber, 
customername,
paymentdate,
amount
FROM customers c JOIN payments p ON c.customernumber = p.customernumber WHERE 
country = 'Canada'
ORDER BY c.customernumber;

--Create a query that shows all USA customers who have not made a payment. 
--Display only the customer number and customer name sorted by customer number.
SELECT 
c.customernumber,
customername
FROM customers c LEFT outer JOIN payments p ON c.customernumber = p.customernumber
WHERE country = 'USA'
AND amount IS NULL 
ORDER BY c.customernumber;


--) Create a view (vwCustomerOrder) to list all orders with the following data 
--for all customers:  

CREATE VIEW vwCustomerOrder AS SELECT
c.customernumber, o.ordernumber, orderdate,
productname, quantityordered, priceeach
FROM orderdetails od JOIN orders o ON o.ordernumber = od.ordernumber
JOIN customers c ON o.customernumber = c.customernumber;
SELECT * FROM vwCustomerOrder;


--Using the vwCustomerOrder  view, display the order information for customer 
--number 124. Sort the output based on order number and then order line number
CREATE VIEW vwCustomerOrder AS SELECT
order.ordernumber, orderDate, orderlinenumber FROM 
orders JOIN orderdetails ON orders.ordernumber = orderdetails.ordernumber
WHERE orders.customernumber = 124
ORDER BY ordernumber,orderlinenumber;
SELECT * FROM vwCustomerOrder;

--Create a query that displays the customer number, first name, last name, 
--phone, and credit limits for all customers who do not have any orders.

SELECT 
c.customernumber,
contactfirstname,
contactlastname,
phone,
creditlimit
FROM customers c left outer JOIN orders o ON c.customernumber = o.customernumber
WHERE ordernumber IS NULL;

--Create a view (vwEmployeeManager) to display all information of all employees
--and the name and the last name of their managers if there is any manager that 
--the employee reports to.  Include all employees, including those who do not 
--report to anyone.
CREATE VIEW vwEmployeeManager AS 
SELECT emplo.*, manag.firstname manager_name, manag.lastname manager_lastename 
FROM employees emplo
LEFT OUTER JOIN employees manag ON emplo.reportsto = manag.employeenumber;

--Modify the employee_manager view so the view returns only employee information
--for employees who have a manager. Do not DROP and recreate the view – modify 
--it. (Google is your friend).
REPLACE VIEW vwEmployeeManager AS
SELECT emp.*, mng.firstname manager_name, mng.lastname manager_lastename
FROM employees emp
JOIN employees mng ON emp.reportsto = mng.employeenumber;

--Drop both customer_order and employee_manager views. 
DROP VIEW e_view; vwCustomerOrder;
DROP VIEW vwEmployeeManager;

