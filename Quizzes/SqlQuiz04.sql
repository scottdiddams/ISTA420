use TSQLV4

--name: Scott Diddams
--date: 2 February 2021
--title: SQL Quiz04

--This is a timed test. You have thirty minutes to complete the test. When you finish the test, upload
--your output file to Canvas. Do not publish your answer to your git repository.
--Create a SQL script in the text editor of your choice. The script should target the TSQLV4 database
--in SQL Server. Name the script quiz04-<NAME>.sql. Replace <NAME> with your name without the angle
--brackets. Run the script in SSMS.


--1. Write a query that returns the company name, contact name, and city of all customers who made an 
--order on the last date that orders were taken. Use nested self contained, list valued subqueries in the
--WHERE clause. Your output should be as follows:


select c.companyname, c.contactname, c.city 
from sales.customers as c
join sales.orders as o on o.custid = c.custid 
where o.orderdate = 
(select max(orderdate) as lastday from sales.orders);

-------------------------------------------
Customer RTXGC Raghav, Amritansh Marseille
Customer NYUHS Moore, Michael Albuquerque
Customer CCKOT Myrcha, Jacek Genve
Customer JMIKW Gonzalez, Nuria Kobenhavn


--2. Write a query that returns the company name, contact name, and city of all customers who made an
--order in July, 2014. Use nested self contained, list valued subqueries in the WHERE clause. Your
--output should be as follows:

select c.companyname, c.contactname, c.city 
from sales.customers as c
join sales.orders as o on o.custid = c.custid 
where o.orderdate in 
(select orderdate from sales.orders where orderdate like '2014-07%');

-------------------------------------------
Customer QXVLA Bansal, Dushyant Strasbourg
Customer VMLOG Benito, Almudena Mxico D.F.
Customer WNMAF Jelitto, Jacek Bern
Customer THHDP Kane, John Graz
Customer CYZTN Grisso, Geoff Brcke
Customer AZJED Carlson, Jason Mnchen
Customer FVXPQ Yuksel, Ayca Caracas
Customer IBVRG Zhang, Frank Rio de Janeiro
Customer UMTLM Langohr, Kris San Cristbal
Customer QNIVZ Miller, Lisa Kln
Customer WULWD Meisels, Josh Rio de Janeiro
Customer NYUHS Moore, Michael Albuquerque
Customer CCKOT Myrcha, Jacek Genve
Customer SFOGW Luper, Steve Charleroi
Customer FAPSM Wickham, Jim Mnster
Customer NRCSK Tuntisangaroon, Sittichai Lyon
Customer ENQZT Elliott, Patrick Reims
Customer ZHYOS Ludwig, Michael Oulu
Customer SRQVM Li, Yan Resende
Customer YBQTI Smith Jr., Ronaldo Seattle

--3. Write a query that returns the customer ID, order ID, order date, and the unit price of the highest
--priced item in the order for all orders shipped to Norway. Use a self contained, scalar valued subquery
--in the SELECT clause. Your output should be as follows

select o.custid, o.orderid, o.orderdate, max(od.unitprice) as goldenkewpie
from sales.orderdetails as od 
join sales.orders as o on o.orderid = od.orderid
where o.shipcountry like 'norway'
group by o.orderid, o.custid, o.orderdate


------------------------------------------
70 10387 2014-12-18 44.00
70 10520 2015-04-29 32.80
70 10639 2015-08-20 62.50
70 10831 2016-01-14 263.50
70 10909 2016-02-26 30.00
70 11015 2016-04-10 25.89


