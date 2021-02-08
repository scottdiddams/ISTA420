.echo on
.headers on
.separator ''


--Name: SCott Diddams
--Date: 26 Jan 2021
--Title: SqlEx03

--1. Display the customer ID, customer contact name, employee ID, employee name, Order ID, number of orders, and total cost of each order. Limit to customer/employee pairs with five or more orders between them, ordered by thedollar amount of the order from highest to lowest. (dollar amount has only 2 decimal places, output is comma separated.

select o.customerID||', "', c.contactname||'", ', e.employeeid||', "', e.firstname||' '||e.lastname||'"' as employeeName, count(o.orderid) as numOrders, printf('%.2f',sum(d.unitprice*(1-d.discount)*d.quantity)) as orderTotal from orders as o join customers as c on o.customerid = c.customerid join employees as e on e.employeeid = o.employeeid join order_details as d on d.orderid = o.orderid group by o.orderid having numOrders >= 5 order by orderTotal desc;

--2. Now display the least productive pairs where total orders are less than 3, and dollar amounts are less than $50. rank-order by increasing dollar amounts starting with the least order.

select o.customerID||', "', c.contactname||'", ', e.employeeid||', "', e.firstname||' '||e.lastname||'"' as employeeName, count(o.orderid) as numOrders, round(sum(d.unitprice*(1-d.discount)*d.quantity),2) as orderTotal from orders as o join customers as c on o.customerid = c.customerid join employees as e on e.employeeid = o.employeeid join order_details as d on d.orderid = o.orderid group by o.orderid having ordertotal < 50 order by orderTotal asc;

--3. Display most productive pairs ranked by the average order amount (only those above $2500).

select o.customerID||', "', c.contactname||'", ', e.employeeid||', "', e.firstname||' '||e.lastname||'"' as employeeName, count(o.orderid) as numOrders, round(avg(d.unitprice*(1-d.discount)*d.quantity),2) as orderTotal from orders as o join customers as c on o.customerid = c.customerid join employees as e on e.employeeid = o.employeeid join order_details as d on d.orderid = o.orderid group by o.orderid having orderTotal >2500 order by orderTotal desc;

--4. Display least productive pairs by average order amount from lowest to highest (order average less than $50).

select o.customerID||', "', c.contactname||'", ', e.employeeid||', "', e.firstname||' '||e.lastname||'"' as employeeName, count(o.orderid) as numOrders, round(avg(d.unitprice*(1-d.discount)*d.quantity),2) as orderTotal from orders as o join customers as c on o.customerid = c.customerid join employees as e on e.employeeid = o.employeeid join order_details as d on d.orderid = o.orderid group by o.orderid having orderTotal <50 order by orderTotal asc;

--5. Display order ID, the customer ID, the customer name, the customer country, and the dollar amount of the order, sorted alphabetically by country and numerically from highest to lowest by the dollar amount of the order, where the order total exceeds $5,000.00

select o.orderid, c.customerid, c.companyname, c.country, round(sum(d.unitprice*(1-d.discount)*d.quantity),2) as orderTotal from orders as o join customers as c on o.customerid = c.customerid join order_details as d on o.orderid = d.orderid group by o.orderid having ordertotal > 5000 order by c.country asc, ordertotal desc;

--6. Display distinct cities, regions, and postal codes where

--a: we have both customers and employees

select distinct c.customerid, e.employeeid, c.city, c.region, c.postalcode from customers as c join employees as e on c.postalcode = e.postalcode;

--b. customers but no employees AND both customers and employees

--select distinct c.customerid, e.employeeid, c.city, c.region, c.postalcode from customers as c left join employees as e on c.postalcode = e.postalcode;

--c. employees but no customers AND both customers & employees

--select distinct c.customerid, e.employeeid, c.city, c.region, c.postalcode from employees as e left join customers as c on c.postalcode = e.postalcode;

