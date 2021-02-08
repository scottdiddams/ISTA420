use TSQLV4

--Name: Scott Diddams
--Date: 3 Feb 21
--File: SQLEx04

--1. Use a derived table to build a query that returns the number of distinct products per year that each
--customer ordered. Use internal aliasing. Use a variable to set the customer number. For example, if
--the customer ID is 1234, the query should report the number of distinct products ordered by customer
--1234 for the years 2014, 2015, and 2016.

declare @cust as int = 12;

	select o.custid, count(distinct od.productid) as productcount, o.orderyear 
	from sales.orderdetails as od
	join  (select year(orderdate) as orderyear, custid, orderid from sales.orders) as o on o.orderid = od.orderid 
	where o.custid = @cust
	group by o.custid, orderyear
	order by o.orderyear;

--2. Use multiple common table expressions to build a query that returns the number of distinct products
--per year that each country's customers ordered. Use external aliasing. Use a variable to set the country
--name. For example, if the country name is France, the query should report the number of distinct
--products ordered by French customers for the years 2014, 2015, and 2016.

declare @country nvarchar(15) = 'France';

with c (orderyear, shipcountry, orderid, custid) as 
	(select year(orderdate) as orderyear, shipcountry, orderid, custid 
	from sales.orders)

select c.orderyear, c.shipcountry, count(distinct od.productid) as productcount 
from sales.orderdetails as od
join c on c.orderid = od.orderid
where c.shipcountry = @country
group by c.orderyear, c.shipcountry


--3. Create a view that shows, for each year, the total dollar amount spent by customers in each country
--for all the years in the database.

drop view if exists sales.NationSales
go
create view sales.NationSales
as

select o.shipcountry, round(sum(od.unitprice*od.qty*(1-od.discount)),2) as totalSales, year(o.orderdate) as orderyear
from sales.orders as o join sales.orderdetails as od on o.orderid = od.orderid
group by o.shipcountry, year(o.orderdate);

select * from sales.NationSales order by shipcountry


--4. Create an inline table valued function that accepts as a parameter a country name and returns a table
--with the distinct products ordered by customers from that country. Products are to be identied by
--both product ID and product name.

Drop Function if exists sales.countryFavorites
go
create function sales.countryFavorites
(@country as nvarchar(15))
returns table
as
return
select distinct p.productname, p.productid, o.shipcountry
from sales.orders as o join sales.orderdetails as od on o.orderid = od.orderid
join production.products as p on p.productid = od.productid
where o.shipcountry = @country
group by p.productname, p.productid, o.shipcountry;

select * from sales.countryFavorites('France')

--5. Use the CROSS APPLY operator to create a query showing the top three products shipped to customers
--in each country. Your report should contain the name of the country, the product id, the product name,
--and the number of products shipped to customers in that country.drop function if exists sales.topProducts
go
create function sales.topProducts
(@country as nvarchar(15), @n as int)
returns table
as
return
select top(@n) count(p.productid) as productorders, p.productname,p.productid, o.shipcountry
from sales.orders as o join sales.orderdetails as od on o.orderid = od.orderid
join production.products as p on p.productid = od.productid
where @country = o.shipcountry
group by p.productname, p.productid, o.shipcountry
order by productorders desc
go

select p.productorders, p.productname, p.productid, o.shipcountry
from sales.orders as o
cross apply sales.topProducts(o.shipcountry, 3) as p
  

select top(3) count(p.productid) as productorders, p.productname, p.productid, o.shipcountry
from sales.orders as o join sales.orderdetails as od on o.orderid = od.orderid
join production.products as p on p.productid = od.productid
where 'USA' = o.shipcountry
group by p.productname, p.productid, o.shipcountry
order by productorders desc



