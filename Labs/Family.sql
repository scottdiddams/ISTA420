.echo on
.headers on

-- Name: Scott Diddams
-- File: family.sql
-- Date: January 11, 2021

drop table if exists family;

create table family (
	id int primary key,
	name text,
	sex int,
	role text,
	weight real
);

insert into family values (1, 'Scott', 1, 'Husband', 175);
insert into family values (2, 'Angie', 0, 'Wife', null);
insert into family values (3, 'Marcus', 1, 'Dog', 76);
insert into family values (4, 'Howie', 1, 'Cat', 10);
insert into family values (5, 'Buford', 1, 'Cat',8.5);

select * from family;
select * from family where role like 'Cat';
select * from family where weight > 150;
select * from family where sex = 0;