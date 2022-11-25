create database info;

use info;
create table informatin(
id int not null primary key,
horror varchar(50),
kids varchar(50)
)

insert into informatin values(1,'Raaz','Inside Out')
insert into informatin values(2,'PHENOMENA','The Mitchells Vs. the Machines')
insert into informatin values(3,'OCULUS ','Ratatouille')
insert into informatin values(4,' Tumbbad',' The Nightmare Before Christmas')
insert into informatin values(5,'A NIGHTMARE',' The Boss Baby ')
insert into informatin values(6,'1920 ','Despicable Me ')
insert into informatin values(7,'RAAT','Up')
insert into informatin values(8,'Darna Mana Hai',' Onward ')
insert into informatin values(9,' Kohraa','Kikis Delivery Service')
insert into informatin values(10,' Bhoot',' The Lion King')
insert into informatin values(11,'Ek Thi Daayan','Spirit Riding Free')
insert into informatin values(12,'Shaapit','The Magic School Bus.')
insert into informatin values(13,'Mahal','Booba')

select * from informatin

--create function display_info(@choose varchar(50)) /// next line include after change in function==> or kids=@choose;
--create or alter function display_info(@choose varchar(50))
r--eturns table as

--return 
--select id from informatin where horror=@choose or kids=@choose;



--select id from display_info ('Booba');
------------------------------------------------------------------------




---------------------------------------------


---------------------------------------------
create or alter function display_test1(@choose varchar(50))
returns @list table  (movies_name varchar(50))as

begin
--declare @list table (movies_name varchar(50))



if @choose='horror'
insert into @list select top 5 horror from informatin

else
insert into @list select top 5 kids from informatin

return 
end

--select * from display_test1('kids')


---------------------------------------------
--select * from informatin


--select top 5 kids from informatin



--select * from display('horror')




