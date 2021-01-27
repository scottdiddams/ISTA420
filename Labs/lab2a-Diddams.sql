.echo on
.headers on
--Name: Scott Diddams
--File: lab2a-diddams.sql
--Date January 19, 2021

--1. What are the regions?

select * from region;


--2. What are the cities?

select TerritoryDescription from territories ORDER BY TerritoryDescription;


--3. What are the cities in the southern region?

select TerritoryDescription from territories Where RegionID = 4 order by TerritoryDescription;



--4. How do you run this query with the fully qualified column name?

select territories.territoryID, territories.territoryDescription, territories.RegionID from territories where regionID = 4;


--5. How do you run this query with a table alias?

select T.territoryDescription, T.territoryID, T.regionID from territories T where regionID = 4;

--6. What are the contact name, telephone number, and city for each customer?

select c.contactname, c.phone, c.city from customers c;

--7. What products are currently out of stock?

select productName, productID, unitsonorder from products where unitsinstock = 0;

--8. What are the ten products on hand in the lowest quantity?

select productName, productID, unitsinstock from products where unitsinstock >0 order by unitsinstock ASC limit 10;

--9. What are the five most expensive products in stock?

select productName, productID, unitsinstock, unitprice from products where unitsinstock >0 order by unitprice desc limit 5;

--10. How many products does Northwind have? How many Customers? Suppliers?

select count(productID) from products; select count(customerID) from customers; select count(supplierID) from suppliers;