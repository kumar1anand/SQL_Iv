create database passport;
--passport number, candidate name, passport expiry date, years of validity, applied through channel (Normal, Priority
use passport

create table pass(
no_var int  primary key,
name_var varchar(50),
expiry_var date,
validity_var int,
channel_var varchar(50)
)



create or alter procedure sp_passport @pass_no int,@candidate_name varchar(50),
@pass_expiry date,@pass_validity int,@applied_channel varchar(50) as
-- procedure sp_passport
insert into pass values(@pass_no,@candidate_name,@pass_expiry,@pass_validity,@applied_channel)



select * from pass
--drop table pass;
--drop procedure sp_passport
exec sp_passport

