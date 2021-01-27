.headers on
.echo on

--Name: Scott Diddams
--File: SQLEx02.sql
--Date: 21JAN21

--1. List the company name, contact name, and country of all customers in Poland.

select companyname, contactname, country from customers where country like'%poland%';

--2. List orderid, orderdate, destination of orders shipped to Berlin.

select orderid, orderdate, shipcity from orders where shipcity like'%berlin%';

--3. How many boxes of Filo Mix are in stock?

select unitsinstock from products where productname like '%filo%';

--4. Telephone numbers of all our shippers

select companyname, phone from shippers;

--5. Who is our oldest employee? youngest?

select employeeid||' '||firstname||' '||lastname||' '||birthdate as oldestemployee from employees order by birthdate asc limit 1;


select employeeid||' '||firstname||' '||lastname||' '||birthdate as youngestemployee from employees order by birthdate desc limit 1;

--6. List suppliers where the owner=sales contact.

select companyname, contactname, contacttitle from suppliers where contacttitle like'%owner%';

--7. Mailing labels for customer representatives
--contacttitle is innappropriate in this context
select contactname||'
'||companyname||'
'||address||'
'||city||' '||region||' '||postalcode||' '||country||'
'|| '
' from customers;

--8. Telephone book for customer representatives
--no customers are listed with middle names
select substring(contactname, instr(contactname,' ')+1) ||', '|| substring(contactname, 1, instr(contactname,' ')-1) ||'     '|| companyname ||'     '|| phone as phonebook from customers;