create database organization;

create table emp(
emp_id int,
emp_name varchar(50),
emp_dept varchar(50),
emp_cities varchar(50),
);
select * from emp;

insert into emp values(1,'anand','Engineering','patna')
insert into emp values(2,'ayush','Engineering','kolkata')
insert into emp values(3,'Ashutosh','Engineering','mathura')
insert into emp values(4,'Aniket','marketing ','patna')
insert into emp values(5,'Ankit','Planning','patna')
insert into emp values(6,'shibu','admin','jaipur')
insert into emp values(7,'shivam','sales','patna')
insert into emp values(8,'madhav','designing','kolkata')

delete from emp where  emp.emp_id=3; 
select distinct emp_cities from emp;

create database cricket_player;

create table cricket(
crick_name varchar(50) NOT NULL,
crick_country varchar(50) NOT NULL,
crick_batsman varchar(50),
primary key (crick_name, crick_country)
);
select * from cricket;

DROP DATABASE cricket_player;

ALTER TABLE cricket
DROP COLUMN crick_batsman

ALTER TABLE cricket
ADD crick_batsman varchar(50) NOT NULL;

ALTER TABLE cricket 
ADD CONSTRAINT PK_CUSTID PRIMARY KEY (crick_name, crick_country);

insert into cricket values('Dhoni','Dhoni','Right_Hand')
insert into cricket values('Virat','India','Right_Hand')
insert into cricket values('Surya','India','Right_Hand')
insert into cricket values('Miller','South African','left_Hand')
insert into cricket values('','South African','left_Hand')
insert into cricket values('','','left_Hand')
insert into cricket values(NULL,NULL,'left_Hand')


create database students;

create table stud(
stud_id int NOT NULL,
stud_name varchar(50),
stud_subj varchar(50),
stud_date_of_join date
primary key(stud_id)
);

select * from stud;

insert into stud values(1,'ramu','physics','2022-01-20') 
insert into stud values(2,'raju','mathematics','2022-07-23')
insert into stud values(3,'anand','dbms','2022-09-28')
insert into stud values(4,'shayam','physics','2022-08-12')
insert into stud values(5,'ankit','physics','2022-11-15')
insert into stud values(6,'ayush','physics','2022-09-21')
insert into stud values(7,'shibu','physics','2022-01-22')
insert into stud values(8,'shivam','physics','2022-09-20')

 YYYY-MM-DD
select * from stud;
SELECT * FROM stud WHERE stud_date_of_join >='2022-01-20'

select * from stud
where stud_date_of_join > '11-01-2022'
---Formate should be  YYYY-MM-DD for correct answer

--SELECT * FROM stud WHERE to_char('MM')='01'

select distinct stud_id from stud
where extract(month from stud_date_of_join) = 6
order by stud_id;

select distinct stud_id from stud
where to_char(stud_date_of_join,'MM') = '06'
order by stud_id;


select MONTH(stud_date_of_join) AS MonthofJoin from stud;
SELECT * from stud WHERE stud_subj='physics' and MONTH(stud_date_of_join)>7

select stud_id, MONTH(stud_date_of_join) AS MonthofJoinTable from stud;

select * from stud
where stud.stud_id >5;

select MONTH(stud_date_of_join)from stud;

select DATE_FORMAT('%M') AS monthbirth from stud;



create table stud1(
stud1_id int NOT NULL,
stud1_name varchar(50),
stud1_subj varchar(50),
stud1_age int,
primary key (stud1_id)
);
select * from stud1;

insert into stud1 values(1,'ayush','mathematics',21)
insert into stud1 values(2,'pawan','mathematics',23)
insert into stud1 values(3,'shawan','ece',24)
insert into stud1 values(4,'niraj','mathematics',25)
insert into stud1 values(5,'Bitu','eee',26)
insert into stud1 values(6,'santosh','mathematics',27)

select * from stud1;



create table stud2(
stud2_id int NOT NULL,
stud2_name varchar(50),
stud2_subj varchar(50),
stud2_age int,
primary key (stud2_id)
);
select * from stud2;


insert into stud2 values(1,'manish','it',23)
insert into stud2 values(2,'kishan','mathematics',20)
insert into stud2 values(3,'dinesh','cse',22)
insert into stud2 values(4,'surya','mathematics',33)
insert into stud2 values(5,'kartik','ece',13)
insert into stud2 values(6,'ravi','mathematics',43)

select * from stud2;

select * from stud2 where(stud2_age>21 and stud2_subj='mathematics') union select * from stud1 where(stud1_age>21 and stud1_subj='mathematics');
select * from stud2 where(stud2_age>5 and stud2_subj='mathematics')
select * from stud1 where(stud1_age>5 and stud1_subj='mathematics')

