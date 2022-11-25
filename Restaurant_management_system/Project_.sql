create database restaurant;


create table registration(
customer_id int identity primary key,
customer_name varchar(50),
customer_email varchar(50),
customer_password varchar(50),
constraint unique_email unique(customer_email)
);
insert into registration (customer_name,customer_email,customer_password) values('anand','anand@gmail.com','anad123')
select * from registration

create or alter proc customer_registration (@c_name varchar(50), @c_email varchar(50),@c_password varchar(50)) as
insert into registration  (customer_name,customer_email,customer_password) values (@c_name,@c_email,@c_password) 

exec customer_registration 'mukesh', 'muke@gmail.com','muke123'

create or alter proc chech_customer_credential (@c_email varchar(50),@c_pass varchar(50)) as
select count(*) from registration where customer_email=@c_email and customer_password=@c_pass
exec chech_customer_credential 'nand@gmail.com','anad123'

create or alter proc cust_fetch (@c_email varchar(50),@c_pass varchar(50)) as
select customer_email,customer_password from registration where customer_email=@c_email and customer_password=@c_pass



create table orderprice(

);
create table admins(
admin_id int identity not null primary key,
admin_email varchar(50),
admin_password varchar(50),
constraint unique_admin unique(admin_email)
);
insert into admins(admin_email,admin_password) values('admin@gmail.com','admin123')

create or alter proc admin_verify (@a_email varchar(50),@a_pass varchar(50)) as
select count(*) from admins where admin_email=@a_email and admin_password=@a_pass

exec admin_verify 'admin@gmail.com','admin123'

create table customerOrder(
customer_id int not null,
customerOrder_id int Identity primary key,
pizza int,
burger int,
fries int,
pasta int,
--total_order_values int,
foreign key (customer_id) references registration(customer_id)
);
select * from registration
select * from customerOrder;
--drop table customerOrder;
insert into customerOrder (customer_id,pizza,burger,fries,pasta) values (1,2,3,2,1)


create or alter  proc customer_order (@cust_id int,@piz_q int, @bug_q int,@fri_q int,@pasta_q int) as
insert into customerOrder(customer_id,pizza,burger,fries,pasta) values 
(@cust_id,@piz_q,@bug_q,@fri_q,@pasta_q)
exec customer_order 1,1,1,2,1

create table orderValues(
customer_id int not null,
customerOrder_id int not null,
total_pizza int,
total_burger int,
total_fries int,
total_pasta int,
foreign key (customer_id) references registration(customer_id),
foreign key (customerOrder_id) references customerOrder(customerOrder_id)
);
--drop table orderValues
create or alter proc total_price (@c_id int ,@co_id int) as
insert into orderValues (customer_id,customerOrder_id) select customer_id,customerOrder_id from customerOrder where customer_id=@c_id and customerOrder_id=@co_id

exec total_price 1,1
select * from orderValues

create or alter proc total_price_item (@c_id int,@co_id int) as
update  orderValues (set total_pizza=a.pizza*200,total_burger=a.burger*100,total_fries=a.fries*50,total_pasta=a.pasta*150   from customerOrder a)  where customer_id=@c_id and customerOrder_id=@co_id

exec total_price_item 1,1


create table orderPrice(
pizza_price int,
burger_price int,
fries_price int,
pasta_price int
);
insert into orderPrice values(120,150,40,140)
select * from orderPrice


select * from customerOrder
delete  from customerOrder where customer_id=2 and customerOrder_id  between 67 and 74
select * from customerOrder
select a.pizza*b.pizza_price+a.burger*b.burger_price+a.fries*b.fries_price+a.pasta*b.pasta_price as totalOrder from customerOrder a,orderPrice b where customer_id=4
Select a.pizza,b.pizza_price,a.burger,b.burger_price,a.fries,b.fries_price,a.pasta,b.pasta_price,a.pizza*b.pizza_price+a.burger*b.burger_price+a.fries*b.fries_price+a.pasta*b.pasta_price as totalOrder from customerOrder a,orderPrice b where customer_id=4

--------update----------
create or alter procedure update_customer(@cus_id int,@cus_name varchar(50),@cus_email varchar(50),@cus_pas varchar(50))
as
update registration set customer_name=@cus_name,customer_email=@cus_email,customer_password=@cus_pas where customer_id=@cus_id
select * from registration 
exec update_customer 3,'prince','prince@gmail.com','ayush'

-----------------------------
create or alter proc display(@c_name varchar(50),@c_email varchar(50),@c_pass varchar(50)) as
select customer_name,customer_email,customer_password from registration where customer_id=@id












