.headers on
.echo on

--Name: Scott Diddams
--File: SQLQuiz02.sql
--Date: 20JAN21

--1. How many seafood products do we have?

select count(productname) as seafoodnum from products where categoryid =8;

--2. Names and IDs of our seafood products

select productname, productid from products where categoryid =8;

--3. Average price of seafood products?

select sum(unitprice)/12 as avgseafoodprice from products where categoryid=8;

--4. Highest priced seafood product

select productname, productid, unitprice from products where categoryid=8 order by unitprice desc limit 1;

--5. Lowest priced seafood product?

select productname, productid, unitprice from products where categoryid=8 order by unitprice asc limit 1;

--6. how many customers do we have in denmark?

select count(customerid) as denmarkcount from customers where country like'%denmark%';

--7. Cutomer names and ID for our danish friends?

select customerid, companyname from customers where country like'%denmark%';

--8. Which customers have no fax number?

select customerid, companyname from customers where fax ='';