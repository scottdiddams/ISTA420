.headers on
.echo on

-- Name:Scott Diddams
-- Title: Lab02b.sql
-- Date: 20 January, 2021

--1. Who are our customers in North America?

select customerid, companyname, country from customers where country = 'USA' or 'Mexico' or 'Canada';

--2. What orders were placed in April, 1998?

select OrderID, orderdate from orders where orderdate like'%1998-04%' and shipcountry = 'Germany';

--3. What sauces do we sell?

select productname from products where productname like '%sauce%';

--4. What is the name of our dried fruit product?

select productname from products where productname like'%dried%';

--5. What employees ship products to germany in December?

select distinct employeeID from orders where orderdate like '%-12-%' order by employeeid asc;

--6. What is the total and net amount of all orders for product 19 where the customer took a discount?

--select orderid, quantity, unitprice, discount, productid, (quantity*unitprice) as total, (quantity*unitprice-quantity*unitprice*discount) as net from order_details where productid=19 and discount>0;

select sum(quantity*unitprice) as total, sum(quantity*unitprice-quantity*unitprice*discount) as net from order_details where productid=19;

--7. Provide a list of employees by title, first name, last name with employees position under their name and a line separating each employee.

.headers on
.mode column
select titleofcourtesy ||' '|| firstname ||' '|| lastname || '
   '|| title || '
   ' from employees;
   
--8. List our customers and the first name only of the customer representative.

select companyname, substr(contactname, 1, instr(contactname,' ')) as contactfirstname from customers;

--9. list customer contacts by alphabetical last name (doesnt work)

--select substr(contactname,(instr(contactname,' ')+1)||', '||substr(contactname, 1, instr(contactname,' ')-1) as abcname from customers order by abcname;

--10. most common pairing of customers and employees with the greatest order volume (num orders placed), no pairings with minimal orders

select customerid, employeeid, count(orderid) from orders group by customerid, employeeid having count(orderid)>=5 order by count(orderid) desc;

--11. highest average selling product by product id where avg = total sales/quantity; limit top 20

select productid, sum(unitprice*quantity) as totsales, count(quantity) as totquant, avg((unitprice*quantity)/quantity) as avgsell from order_details group by productid order by avgsell desc limit 20;

--quiz 2 due tonight (do your best)
--C# ch3 HW
--no more lab