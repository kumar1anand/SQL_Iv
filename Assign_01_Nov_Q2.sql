create database event;
use event;


--1. Create a table where there are the following fields: event id, 
--   events(anniversary, conference, seminar, party,etc), event date, organizer, location, total cost, etc



create table event_deatils(
event_id int not null primary key, 
event_type varchar(50), --(anniversary, conference, seminar, party,etc)
event_date date, 
organizer varchar(50), 
event_loc varchar(50), 
total_cost int
);
--drop table event_deatils
insert into event_deatils values(1,'party','2022-11-04','anand','Patna',1000000)
insert into event_deatils values(2,'seminar','2021-12-04','ayush','Vellore',10230000)
insert into event_deatils values(3,'party','2012-07-04','shivam','Patna',10323200)
insert into event_deatils values(4,'seminar','2013-01-04','shibu','Varanashi',10005630)
insert into event_deatils values(5,'anniversary','2023-09-04','mukesh','Delhi',10567700)
insert into event_deatils values(6,'conference','2024-08-04','manish','Vellore',10045566)
insert into event_deatils values(7,'seminar','2021-01-04','aman','Vellore',10566777)
insert into event_deatils values(8,'party','2018-08-04','ashutosh','Dharamshala',14567700)
insert into event_deatils values(9,'conference','2021-03-19','bitu','Delhi',10098760)
insert into event_deatils values(10,'seminar','2020-05-20','prince','Chennai',10345670)
insert into event_deatils values(11,'party','2019-07-04','ankit','Vellore',10876500)
insert into event_deatils values(12,'conference','2014-04-04','santosh','Patna',15432220)
insert into event_deatils values(13,'party','2015-08-04','sahyam','Delhi',14345000)
insert into event_deatils values(14,'seminar','2017-01-04','mahesh','Patna',10043420)
insert into event_deatils values(15,'conference','2016-10-04','pooja','Vellore',10456320)

select * from event_deatils
--------------------------------------------------------------------------
--2. Create a Stored Procedure to fetch all the events happening in the month of (get the input from the user). 
--   Display the results on screen.
--   Example: If the user inputs September, display all the events that happened in September.



CREATE or alter procedure event_info @input_month varchar(50) AS 


SELECT 
	event_type
FROM
event_deatils

WHERE
	--MONTH(event_date) = 8 
	DATENAME(MM,event_date) LIKE @input_month
	
--exec event_info @input_month='August'
--exec event_info 'August'
	
	--DATENAME(MM,EventDate) LIKE 'August'
	-- Filter to only look at August
	   	 
------------------------------- Doubt----------------------------
--3. Create a UDF to calculate the events that cost the maximum money.

create or alter function cal()
returns @ans table (eventType varchar(50)) as

begin
insert into @ans select  event_type from event_deatils where total_cost=(SELECT MAX(total_cost) as max_money FROM event_deatils)
return 
end

select * from cal()


--SELECT MAX(total_cost) as max_money FROM event_deatils;
--select * from event_deatils;

--select  event_id, events_type from event_deatils where total_cost=(SELECT MAX(total_cost) as max_money FROM event_deatils)


--------------------------------------------------------------------------------------------------------
--4. Create a Stored Procedure and display on screen, the events that happened in a particular location. 
--   (Get the location as input from the user)

create or alter proc event_happen @loc varchar(50) as
select event_type from event_deatils where event_loc=@loc

exec event_happen 'Delhi'