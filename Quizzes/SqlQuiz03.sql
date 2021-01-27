.echo on
.headers on



--Name: SCott Diddams
--Date: 26 Jan 2021
--Title: SqlQuiz03


--1. Display employee ID, first name, last name, and average amount of all orders by that employee - Dont use group by
--using group by
select e.employeeid, e.firstname, e.lastname, round(avg(d.unitprice*(1-d.discount)*d.quantity),2) as orderTotal from orders as o join employees as e on o.employeeid = e.employeeid join order_details as d on o.orderid = d.orderid and o.orderid group by e.employeeid order by orderTotal desc;


--select (select e.employeeid from employees as e join orders as o on o.employeeid = e.employeeid) as employeeid, e.firstname, e.lastname, round(avg(d.unitprice*(1-d.discount)*d.quantity),2) as orderTotal from orders as o join employees as e on o.employeeid = e.employeeid join order_details as d on o.orderid = d.orderid and o.orderid order by orderTotal desc;

--2. 30 minutes has elapsed
