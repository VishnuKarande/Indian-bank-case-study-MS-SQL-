create database Pratices
go
 --use tha database
 use Pratices
 go

--create Database
create table EMP
(
	Eid		int				primary key,
	name	varchar(100)	not null,
	salary	int				null
)
go

--insert into valuse
insert into EMP values(1,'Ravi',1000)
insert into EMP values(2,'Nitesh',null)
insert into EMP values(3,'Amit',1000)
go

--see the data
select * from EMP
go

-----------------------isnull------------------
--Remove null values
select Eid,name,isnull(salary,0) as Salary
from empg
go

--whose salary is null
select *
from EMP
where salary is null
go

----whose salary is not null values
select *
from EMP
where salary is not null
go

-- increment the null values 
select * 
from EMP
update EMP
set salary =ISNULL(salary,0)+2000
go

select * 
from EMP
update EMP
set salary = ISNULL(salary,0)+2
go

--Coalese () function
create table EMP3
( 
	eid				int				primary key,
	fristName		varchar(100)	null,
	MiddleName		varchar(100)	null,
	LastName		varchar(100)	null	
)
go

--insert values
insert into EMP3 values(1,'Ravi', null , 'Kumar')
insert into EMP3 values(2,'Latha', null , null)
insert into EMP3 values(3,null, 'Dhavan' , null)
insert into EMP3 values(4,'Surya', 'Prakash',null)
insert into EMP3 values(5,null, null , 'Aman')
go

--see the data
select * from EMP3
go

------------------------Using COALESCE------------------

--returns 1st non-null values
select COALESCE(fristName,MiddleName,LastName) as Empname
from EMP3
go

--FullName
select isnull(fristName, '  ')+isnull(MiddleName,' ')+isnull(LastName,' ') as Full_name
from EMP3
go
--using concat() function
--New SQl Server 2012
select concat (fristName,MiddleName,LastName) as Full_name
from EMP3
go


 