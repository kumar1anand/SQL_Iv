create database resturant;

create table customer(
cust_id int NOT NULL,
cust_name varchar(50),
cust_address varchar(50),
cust_tel varchar(10),
cust_email varchar(40)
);

insert into customer values(1,'anand','rxl','12342222','xy1232@gmail.com')
insert into customer values(2,'manish','rgh','1235435','gjf1232@gmail.com')
insert into customer values(3,'shivam','sug','1235435','fjhgj1232@gmail.com')
insert into customer values(4,'ankit','patna','467672222','gcj1232@gmail.com')
insert into customer values(5,'mukesh','ranchi','687642222','ytuhj1232@gmail.com')
insert into customer values(6,'shubham','motihari','6756882222','xgh1232@gmail.com')
insert into customer values(7,'rajan','pipra','12342222','tyy1232@gmail.com')
insert into customer values(8,'kishan','shivhar','12342222','awr1232@gmail.com')
insert into customer values(9,'ramna','bang','2386323','hw2632@gmail.com')
insert into customer values(10,'shyam','hyd','89757763','ey2232@gmail.com')
select * from customer;

ALTER TABLE customer 
ADD CONSTRAINT PK_CUSTID PRIMARY KEY (cust_id);
ALTER TABLE customer ADD PRIMARY KEY (cust_id);

create table item(
item_id int NOT NULL, 
item_name varchar(50),
item_price int,
customer_id int NOT NULL,
primary key (item_id),
FOREIGN KEY (customer_id) REFERENCES customer(cust_id)
);

insert into item values(1,'chiecken',120,1)
insert into item values(2,'motton',120,1)
insert into item values(3,'pizza',120,2)
insert into item values(4,'Hamburger',120,1)
insert into item values(5,'Hot dog',120,3)
insert into item values(6,'Sandwich',120,7)
insert into item values(7,'Milk shake',120,8)
insert into item values(8,'Soft drink',120,10)
insert into item values(9,'Onion ring',120,9)
insert into item values(10,'Fried chicken',120,10)

select * from item;

create table orders(
orders_id int NOT NULL Primary key,
customer_id int NOT NULL,
orders_datetime datetime,
FOREIGN KEY (customer_id) REFERENCES customer(cust_id)
);

--YYYY-MM-DD
--hh:mm:ss[.nnnnnnn]

insert into orders values(1,2,'2016/01/20 14:08:25')
insert into orders values(2,3,'2016/01/20 14:08:25')
insert into orders values(3,5,'2016/01/20 14:08:25')
insert into orders values(4,3,'2016/01/20 14:08:25')
insert into orders values(5,9,'2016/01/20 14:08:25')
insert into orders values(6,7,'2016/01/20 14:08:25')
insert into orders values(7,6,'2016/01/20 14:08:25')
insert into orders values(8,4,'2016/01/20 14:08:25')
insert into orders values(9,9,'2016/01/20 14:08:25')
insert into orders values(10,1,'2016/01/20 14:08:25')

delete from orders where  orders.orders_id=1; 
select * from orders;

create table order_item(
ord_item_id int NOT NULL Primary key,
order_id int NOT NULL,
item_id int NOT NULL,
customer_id int NOT NULL,
product_quantity varchar(50),
FOREIGN KEY (customer_id) REFERENCES customer(cust_id)
);

insert into order_item values(1,11,10,1,'good')
insert into order_item values(2,15,10,4,'not good')
insert into order_item values(3,12,10,6,'bad')
insert into order_item values(4,14,10,3,'too good')
insert into order_item values(5,17,10,9,'bad')
insert into order_item values(6,17,10,6,'good')
insert into order_item values(7,18,10,10,'bad')
insert into order_item values(8,10,10,5,'bad')
insert into order_item values(9,13,10,4,'too good')
insert into order_item values(10,12,10,3,'bad')

select * from order_item;



create table student(
stud_id int NOT NULL Primary key,
stud_marks int,
stud_cource varchar(50)
);

insert into student values(1,100,'math')
insert into student values(2,99,'math')
insert into student values(3,88,'math')
insert into student values(4,97,'math')
insert into student values(5,100,'math')
insert into student values(6,79,'math')
insert into student values(7,88,'math')
insert into student values(8,89,'math')
insert into student values(9,84,'math')
insert into student values(10,80,'math')

select * from student;
SELECT MAX(stud_marks) as max_marks_obtain FROM student;

create table telephone_directory(
citizens_id int NOT NULL Primary Key,
citizens_name varchar(50),
citizens_tel_number int, 
citizens_address varchar(50),
citizens_profession varchar(50)
);

--drop table telephone_directory;
insert into telephone_directory values(1,'anand',112122,'bahu','student')
insert into telephone_directory values(2,'kishan',112122,'bahu','student')
insert into telephone_directory values(3,'krishna',112122,'bahu','student')
insert into telephone_directory values(4,'ayush',112122,'bahu','student')
insert into telephone_directory values(5,'priya',112122,'bahu','student')
insert into telephone_directory values(6,'nikam',112122,'bahu','student')
insert into telephone_directory values(7,'pooja',112122,'bahu','student')
insert into telephone_directory values(8,'leena',112122,'bahu','teaching')
insert into telephone_directory values(9,'ashma',112122,'bahu','teaching')
insert into telephone_directory values(10,'geetha',112122,'bahu','manager')
insert into telephone_directory values(11,'nikam',112122,'bahu','student')
insert into telephone_directory values(12,'dharaya',112122,'bahu','doctor')
insert into telephone_directory values(13,'kritika',112122,'bahu','nurse')
select * from telephone_directory;


select count( * ) from telephone_directory  where citizens_profession in ('student','doctor','teaching');

select count( * ) as students from telephone_directory where citizens_profession='student' 
union select count( * ) as teacher_profession from telephone_directory where citizens_profession='teaching';
