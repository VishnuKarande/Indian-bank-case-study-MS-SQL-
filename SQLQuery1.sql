 --SQL Command
 --singal line command

 /*
 multiline 
 command
 */

 create database company
 go

 drop database company
 go

 create database company
 go

use company
go

create table Dept
(
DeptID int primary key,
DeptName varchar(100) not null
)
go

select * from Dept

insert into Dept values (10, 'sales')
insert into Dept values (20,'Marketing')
