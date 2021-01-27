.echo on
.headers on

--Title: SQL Lab 03
--Date: 26 Jan 2021
--Name: Scott Diddams

--1. what is the order number and the date of each order sold by each employee?

select E.employeeid, O.orderid, O.orderdate from employees as E inner join orders as O on o.employeeid = e.employeeid limit 10;

--2. List each territory by region

select t.territorydescription, r.regiondescription from territories as t join region as r on t.regionid = r.regionid limit 10;

--3. What is the supplier name for each product alphabetically by supplier?

select s.companyname, p.productname from suppliers as s join products as p on s.supplierid = p.supplierid order by s.companyname limit 10;

--4. For every order on 5 May 1998, how many of each item was ordered, and what was the price of the item?

select o.orderid, d.productid, d.quantity, (d.unitprice*(1-d.discount)) as itemPrice from orders as o join order_details as d on o.orderid = d.orderid where o.orderdate = '1998-05-05' limit 10;

--5. For every order on 5 May, 1998 how many of each item was ordered giving the name of the item, and what was the price of the item?

select o.orderid, p.productname, d.quantity, (d.unitprice*(1-d.discount)) as itemPrice from orders as o join order_details as d  on o.orderid = d.orderid join products as p on p.productid = d.productid where o.orderdate = '1998-05-05' limit 10;

--6. For every order in may, 1998, what was the customers name and the shippers name?

select c.companyname as customerName, s.companyname as shipperName, o.orderdate from orders as o join shippers as s on s.shipperid = o.shipperid join customers as c on o.customerid = c.customerid where o.orderdate like'%1998-05%' limit 10;

--7. What is the customer's name and the employee's name for every order shipped to france?

select c.companyname as customerName, (e.firstname||' '|| e.lastname) as employee, o.shipcity from orders as o join customers as c on o.customerid = c.customerid join employees as e on e.employeeid = o.employeeid where o.shipcountry like '%france%' limit 10;

--8. List products by name shipped to germany

select p.productname, o.shipcity from orders as o join order_details as d on o.orderid = d.orderid join products as p on d.productid = p.productid where o.shipcountry like'%germany%' limit 10;