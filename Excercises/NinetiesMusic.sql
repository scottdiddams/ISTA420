.echo on
.headers on

-- Name: Scott Diddams
-- File: NinetiesMusic.sql
-- Date: January 12, 2021

drop table if exists NinetiesMusic;

create table NinetiesMusic (
	track text primary key,
	artistName string,
	yearReleased int CHECK (1989 > yearReleased < 2000),
	timesPlayed int,
	award string CHECK (award = 'Platinum') NOT NULL
);


insert into NinetiesMusic values ('semi Charmed Kind of Life', 'Third Eye Blind', 1997, 267369308, null);
insert into NinetiesMusic values ('Genie In a Bottle', 'Christina Aguilara', 1999, 194901732, 'Platinum');
insert into NinetiesMusic values ('smells Like Teen Spirit', 'Nirvana', 1991, 875080494, 'Platinum');
insert into NinetiesMusic values ('I want it that way', 'Backstreet Boys', 1999, 696774038, 'Platinum');
insert into NinetiesMusic values ('I will always love you', 'Whitney Houston', 1992, 356823146, 'Gold');
insert into NinetiesMusic values ('The Middle', 'Jimmy Eat World', 2001, 388387635, null);

select * from NinetiesMusic;







