use tsqlv4;
go
drop table if exists dbo.presidents;
go

create table dbo.presidents(
ID integer not null
CONSTRAINT PK_Presidents PRIMARY KEY,
LastName varchar(50),
FirstName varchar(50),
MiddleName varchar(50),
OrderofPresidency integer,
DateofBirth date,
DateofDeath date,
TownCountyofBirth varchar(50),
StateofBirth varchar(50),
HomeState varchar(50),
PartyAffiliation varchar(50),
DateTookOffice date,
DateLeftOffice date,
AssassinationAttempt varchar(50),
Assassinated varchar(50),
ReligiousAffiliation varchar(50),
img varchar(50)
);
go
bulk insert presidents from 'C:\users\asus\mssa2021\ista420\presidents.csv'
	with
	(
	batchsize = 44,
	firstrow = 2,
	lastrow = 45,
	format = 'csv'
	);

alter table dbo.presidents
drop column img;


--header deleted via bulk insert, however, to do this manually would revert data types to varchar(50) and execute the following:

--delete from dbo.presidents
--output deleted.ID, deleted.lastname, deleted.firstname, deleted.middlename, deleted.orderofpresidency, deleted.dateofbirth,
	--deleted.dateofdeath, deleted.towncountyofbirth, deleted.homestate, deleted.partyaffiliation, deleted.datetookoffice,
	--deleted.dateleftoffice, deleted.assassinationattempt, deleted.assassinated, deleted.religiousaffiliation
	--where ID = 'ID'

--ID set as primary key - is a not null, unique integer column through create table function

update dbo.presidents
	set dateleftoffice = '2017-01-20',
		assassinationattempt = 'false',
		assassinated = 'false'
	where id = 44;

insert into dbo.presidents(ID, lastname, firstname, middlename, orderofpresidency, dateofbirth, dateofdeath, towncountyofbirth, stateofbirth,
	homestate, PartyAffiliation, datetookoffice, dateleftoffice, assassinationattempt, assassinated, religiousaffiliation)
	values(45, 'Trump', 'Donald', 'John', 45, '1946-06-14', null, 'Queens', 'New York', 'New York', 'Republican', '2017-01-20', '2021-01-20',
	'false', 'false', 'unafiliated christian');

insert into dbo.presidents(ID, lastname, firstname, middlename, orderofpresidency, dateofbirth, dateofdeath, towncountyofbirth, stateofbirth,
	homestate, PartyAffiliation, datetookoffice, dateleftoffice, assassinationattempt, assassinated, religiousaffiliation)
	values(46, 'Biden', 'Joseph', 'Robinette', 46, '1942-11-20', null, 'Scranton', 'Pennsylvania', 'Delaware', 'Democrat', '2021-01-20', null,
	'false', 'false', 'Catholic');


--how many from each party per state:

select distinct homestate, Partyaffiliation, count(partyaffiliation) over(partition by HomeState) as PartyCount
from presidents
group by HomeState, partyaffiliation;

--days spent in office:

select lastname, firstname, datediff(day, datetookoffice, dateleftoffice) as daysInOffice
from presidents;

--age when term began:

select lastname, firstname, datediff(year, dateofbirth, datetookoffice) as ageInOffice
from presidents;

--Correlation between party and religion?

select distinct religiousaffiliation, Partyaffiliation, 
count(partyaffiliation) over(partition by religiousaffiliation) as PartyCount
from presidents
group by religiousaffiliation, partyaffiliation;

-- there is no correlation between party and religious affiliation