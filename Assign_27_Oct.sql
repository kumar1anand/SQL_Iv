--1.Create a Stored Procedure to show only the Employees working on C# in the base location of Bangalore. 
--Display the result set with Employee ID, Name, Working Language and Base Location.

--create database Employee1
use Employee1;

create table emp(
emp_id int not null primary key,
emp_name varchar(20),
emp_lang varchar(20),
emp_loc varchar(20)
)

insert into emp values(1,'Anand','C#','Banglore')
insert into emp values(2,'Manish','C++','Banglore')
insert into emp values(3,'puja','C#','Hyderabad')
insert into emp values(4,'Mukesh','C','Noida')
insert into emp values(5,'Ayush','Python','Dehli')
insert into emp values(6,'sanjana','c#','Banglore')

SELECT* from emp

create or alter proc proc_1 @lang varchar(20), @loc varchar(20) as

SELECT * from emp where emp_lang=@lang and emp_loc=@loc


EXEC proc_1 'C#','Banglore'




--2.Create a Stored Procedure to calculate total marks and display ranks of students accordingly. 
--Have atleast 10 students in the result set.
--Total marks should include marks from Maths, Economics, Commerce, English and Computer Science.
use students

create table stud(
stud_id int not null primary key,
stud_name varchar(50)
);
--drop table stud;
select * from stud;
insert into stud values(5,'anand')
alter table stud add Maths int, Economics int, Commerce int, English int, Computer int
update stud set Maths = 90, Economics = 87, Commerce = 93, English = 98, Computer = 90 where stud_id =5

insert into stud values(11,'mukesh',97, 66,94, 58, 93)
insert into stud values(6,'shiva',87, 96,84, 88, 98)
insert into stud values(1,'devki',77, 56,84, 88, 63)
insert into stud values(2,'manish',79, 36,84, 88, 94)
insert into stud values(3,'ayush',97, 56,84, 88, 67)
insert into stud values(4,'ramesh',67, 86,84, 88, 93)
insert into stud values(7,'dinesh',87, 36,84, 88, 97)
insert into stud values(8,'shivam',57, 76,84, 88, 99)
insert into stud values(9,'ankit',47, 86,84, 88, 94)
insert into stud values(10,'shibu',70, 96,84, 88, 90)

create or alter proc students_mark as
declare @total table(Name nvarchar(30), Total int)

insert into @total select stud_name, Maths+Economics+Commerce+English+Computer from stud
select * from @total order by Total desc



exec students_mark






--3. Display students information (Name, Age, Sex, Course, Year of Study, etc). 
--Give the Year of study as an input parameter and display only those students (If the input is 1, only show first year students.)
--Use Stored Procedure for:
--Creating a table with all the information,
--Displaying all the information,
--Showing the year of study students according to the input parameter.

create database stud_info
use stud_info;


create table stud(
stud_id INT PRIMARY KEY,
stud_name varchar(20),
stud_age INT,
stud_sex varchar(10),
stud_course varchar(20),
years_of_study INT
)
insert into stud values(1,'Anand',22,'M','CSE',2)
insert into stud values(2,'ankit',24,'M','EEE',1)
insert into stud values(3,'manish',23,'M','CSE',4)
insert into stud values(4,'mukesh',22,'M','CS',2)
insert into stud values(5,'shivam',21,'F','CSE',4)
insert into stud values(6,'Ayush',22,'F','IT',3)
insert into stud values(7,'Dinesh',24,'F','ECE',4)
insert into stud values(8,'Devki',25,'F','CS',2)
select * from stud;




create or alter proc p_2 @year INT AS 
 
SELECT * from stud where years_of_study=@year


EXEC p_2 4

--4.Create a user defined function where you can calculate interest on a savings account with the formula pnr/100. 
--If it is a checking account, calculate the interest as 5% on principal amount.

create function Simple_Interest(@p int,@n int)
returns int as
BEGIN
   DECLARE @r AS INT
   SET  @r=5
  DECLARE @res AS BIGINT
  SELECT  @res = (@p*@n*@r)/100
  RETURN @res
END

SELECT dbo.Simple_Interest(90000,4)





--5.Create a table that has time from various time zones (US, UK, Dubai, Singapore, etc) 
--Create a UDF where you set the alarm clock to 5 am if the time zone is Dubai, 6 am if it is UK and 7 am 
--if it is any other time zone.


create table time_zone(
country_code int not null primary key,
country_name varchar(20),
)


insert into time_zone values(1,'India')
insert into time_zone values(2,'China')
insert into time_zone values(3,'Bhutan')
insert into time_zone values(4,'Bangladesh')
insert into time_zone values(5,'Nepal')
insert into time_zone values(6,'Sri Lanka')
insert into time_zone values(7,'Maldiv')
insert into time_zone values(8,'Indoneshia')



SELECT* FROM time_zone

create or alter function timezone (@country_name varchar(20))
RETURNS varchar(20) AS
BEGIN
DECLARE @res AS varchar(20)
   IF @country_name='India'
    set @res = '5 am'
   ELSE IF @country_name='China'
     set @res = '6 am'
   ELSE 
   set @res = 'other time'

   RETURN @res
END

select dbo.timezone('India')






