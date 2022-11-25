--1.Write a query to fetch the first name and last name of a person from a table and display it together as "FULL NAME"
create database personDetails;

create table person(
person_id int not null primary key,
person_fName varchar(50),
person_lName varchar(50)
);
select * from person;

insert into person values(1,'anand','kumar')
insert into person values(2,'manish','jaiswal')
insert into person values(3,'mukesh','lodha')
insert into person values(4,'vaani','tripathi')
insert into person values(5,'ayush','jain')
insert into person values(6,'ankit','singh')

--SELECT CONCAT(first_name , ' ', last_name) as Name from TableName
select CONCAT(person_fName ,' ',person_lName) as full_name from person;
--select person_fName from person union select person_lName from person ;

--2. Write a query to find all the people from a given country. 
--  (Say, If 5 people are from Delhi, 3 are from Mumbai, it should list all the 8 people) . 
--  The city, country information should be in a different table, use joins.

create table city(
city_code int not null primary key,
city_name varchar(50)
);
--drop table city;

insert into city values(111,'bangalore')
insert into city values(2332,'Delhi')
insert into city values(4341,'Mumbai')
insert into city values(3435,'Delhi')
insert into city values(8439,'Mumbai')
insert into city values(89374,'Delhi')
insert into city values(09192,'Mumbai')
insert into city values(02834,'Delhi')
insert into city values(1823,'Mumbai')

create table country(
country_code int not null primary key,
country_name varchar(50),
city_id int not null
FOREIGN KEY (city_id) REFERENCES city(city_code)
);
select * from country;
insert into country values(1,'India',1823)
insert into country values(2,'Nepal',1823)
insert into country values(3,'Bhutan',1823)
insert into country values(4,'India',3435)
insert into country values(5,'India',1823)
insert into country values(6,'India',4341)
insert into country values(7,'India',02834)
insert into country values(8,'India',1823)
insert into country values(9,'India',2332)
insert into country values(10,'India',1823)

select * from country;
select * from city;
Select * from country  INNER JOIN city on country.city_id=city.city_code and country_name='India';
--3. Write a sql query to fetch only the first 3 letters of the city from the city table
create table city(
city_code int not null primary key,
city_name varchar(50)
);
select * from city;
insert into city values(1222,'Hyderabad')
insert into city values(2323,'Gurgaon')
insert into city values(2232,'Noida')
insert into city values(2089,'Kolkata')
insert into city values(3442,'Bangalore')

select SUBSTRING(city_name,1,3) from city;



--4. Write a query to print the names of the employees and departments from the 
--   employee table with name ascending and department descending.
create table emp(
emp_id int not null primary key,
emp_name varchar(50),
emp_dept varchar(50)
);
--drop table emp;
select * from emp;
insert into emp values(1,'anand','soft')
insert into emp values(2,'manish','android')
insert into emp values(3,'mukesh','webdev')
insert into emp values(4,'ayush','javadev')
insert into emp values(5,'ashutosh','frontdev')
select * from emp;

select * from emp e
order by e.emp_name ASC,
e.emp_dept DESC;




--5. Write a query to fetch the employee names who have salaries more than 50000 and less than 80000

create table emp(
emp_id int not null primary key,
emp_name varchar(50),
emp_salary int
);
--drop table emp;
select * from emp;
insert into emp values(1,'ayush',100000)
insert into emp values(2,'shubham',75000)
insert into emp values(3,'ashutosh',65000)
insert into emp values(4,'vaibhav',40000)
insert into emp values(5,'aditya',25000)
insert into emp values(6,'prince',65000)
insert into emp values(7,'shivam',75000)
insert into emp values(8,'shonu',65000)


select * from emp where emp_salary between 50000 and 80000;



--6. Write a sql query to fetch the list of employees who draw the same salary.
select * from emp;

select distinct e1.emp_id,e1.emp_salary,e1.emp_name from emp e1
inner join emp e2
on e1.emp_salary=e2.emp_salary
AND e1.emp_name<>e2.emp_name






--7. Write a query to fetch all students from the student table who do not study Maths and Physics
create table stud(
stud_id int primary key,
stud_study varchar(50),
stud_join date
);

--drop table stud;// YYYY-MM-DD
insert into stud values(1,'computer','2020-07-26')
insert into stud values(2,'chemistry','2011-10-26')
insert into stud values(3,'maths','2021-09-26')
insert into stud values(4,'maths','2022-04-26')
insert into stud values(5,'physics','2021-09-26')
insert into stud values(6,'biology','2018-10-26')
insert into stud values(7,'maths','2017-01-26')
insert into stud values(8,'english','2022-10-26')
insert into stud values(9,'hindi','2022-11-26')
insert into stud values(10,'physics','2022-02-26')
--insert into stud values(10,'maths','25-10-2022')

--delete  from stud where stud.stud_id=9
select * from stud;
select * from stud
where stud_study!='maths' and stud_study!='physics'


--8. Write a query to fetch all students who joined after Feb 2020


select * from stud where year(stud_join)>=2020 and month(stud_join) >2;



--9. From an orders table, fetch the maximum purchase amount a salesman has made in the last 6 months.

create table orders(
orders_id int not null primary key,
orders_item varchar(50),
purchase_amount int,
orders_date date
);
--drop table orders;
select * from orders;
insert into orders values(1,'chiecken',1202,'2022-10-27')
insert into orders values(2,'motton',12023,'2020-01-20')
insert into orders values(3,'pizza',1202,'2011-02-27')
insert into orders values(4,'Hamburger',1201,'2012-12-27')
insert into orders values(5,'Hot dog',1203,'2018-10-27')
insert into orders values(6,'Sandwich',1207,'2022-04-27')
insert into orders values(7,'Milk shake',1208,'2022-06-27')
insert into orders values(8,'Soft drink',12010,'2022-02-27')
insert into orders values(9,'Onion ring',1209,'2022-03-27')
insert into orders values(10,'Fried chicken',12010,'2022-10-27')

--Give diff of date from current date
--select * ,DATEDIFF(month,orders_date,GetDate()) from orders --Give diff of date from current date

--Give orders details of last 6 months
select * from orders
where DATEDIFF(month,orders_date,GetDate())<=6;


select * from orders


-- code for solution
SELECT MAX(purchase_amount) 
FROM orders 
WHERE DATEDIFF(month,orders_date,GetDate())<=6;