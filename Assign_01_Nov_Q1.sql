create database sales;
use sales;

create table sales_info(
region varchar(50) not null primary key,
sales_amt1 int, 
sales_amt2 int, 
sales_amt3 int
);

insert into sales_info values('Delhi',2000,4000,5000)
insert into sales_info values('Hyderabad',245000,404500,545000)
insert into sales_info values('Noida',204500,445000,50600)
insert into sales_info values('Bangalore',672000,467000,500780)
insert into sales_info values('Jaipur',200670,40500,75000)
insert into sales_info values('Ranchi',200045,400560,556000)
insert into sales_info values('Patna',200560,400760,56000)
insert into sales_info values('Kolkata',205600,400660,500770)
insert into sales_info values('Danapur',200450,406500,505600)
insert into sales_info values('Mohali',206700,406700,506700)
insert into sales_info values('Dharamshala',20070,400670,506700)
insert into sales_info values('Muzaffarpur',206700,406700,567000)
insert into sales_info values('Bhagalpur',205500,405600,50700)
select * from sales_info;
--drop table sales_info
SELECT (sales_amt1+sales_amt2+sales_amt3)/3 FROM sales_info where region='Delhi'
----------------------------       function==>1   ------------------------------------------------
create or alter function  sales_values(@region_var varchar(50))
returns table as

return 
select * from sales_info where region=@region_var

select * from sales_values('Delhi')
----------------------------       function===>2   -----------------------------------------

create or alter function average(@region_var1 varchar(50))
returns @ans table (avarage_value int) as

begin
--declare @sum as int
-- ((select sales_amt1 from sales_info where region=@region_var1)+(@region.sales_amt2+@region.sales_amt3))
--insert into @ans select * from sales_values(@region_var1)
insert into @ans SELECT (sales_amt1+sales_amt2+sales_amt3)/3 FROM sales_info where region=@region_var1
return
end

select * from average('Delhi')