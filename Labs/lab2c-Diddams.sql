.echo on
.headers on

--Name: Scott Diddams
--Date: 25 January 2021
--File:TSQL Lab02C

--1. List employee ID with numer of sales from most to least to recognize employyes with greater sales

select employeeID, count(orderID) as numSales from orders group by(employeeID) order by numSales desc;

--2. display the average discounts taken by all customers for products that cost more than $50. Display the the average discount from highest price to lowest price.

select productid, unitprice, printf("%.2f",avg(discount)) as avgDisc from order_details where unitprice >= 50 group by productID  order by unitprice desc;

--3. Display the number of orders each shipper delivered to each country where theyve shipped more than 10 orders.

select shipperid, shipcountry, orderid, count(orderID) as totalOrders from orders group by shipcountry having totalOrders >10 order by shipcountry;

--4. Display the time between the order date and ship date

select orderID, shipperid, (julianday(shippeddate) - julianday(orderdate)) as lagTime from orders order by lagtime desc limit 10;

--5. Display the average lag time per shipper

select shipperID, avg(julianday(shippeddate) - julianday(orderdate)) as lagtime from orders group by shipperID;

--6. For inventory, display the total price of each product on hand alphabetically by product name

select productname, unitprice, (unitprice*unitsinstock) as totalWorth from products where unitsinstock > 0 group by productname order by productname asc limit 10;

--7. Whats the dollar total we have tied up in inventory?

select (sum(unitprice*unitsinstock)) as totalInventoryWorth from products;

--8. Display customer-employee preference by displaying the customer ID, employee ID and the number of interactions greater than 5

select customerid, employeeid, count(orderid) as totalOrders from orders group by customerid having totalorders > 5 order by customerid limit 10;

--9. How many days days were you in the service?

select (Julianday('2021-05-21')-julianday('2011-03-10')) as timeInService;

-- 10. use built in time and date functions:
--What is todays date?
select date('now');
--What was the first day of the month?
select date('now', 'start of month');
--What will be the first day of next month?
select date('now', 'start of month', '+1 month');
--what is the last day of this month?
select date('now', 'start of month', '+1 month', '-1 day');