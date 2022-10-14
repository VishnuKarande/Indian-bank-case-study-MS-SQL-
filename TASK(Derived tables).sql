use INDIAN_BANK
go

--Que-FinD Emp With salary Higher than Deptment AVG

select * from sys.tables
where name = 'EmpInfo'
go

--create Table
create table EmpInfo
(	
	EID			int				primary key,
	EmpName		varchar(100)	not null,
	salary		money			not null,
	DeptName	varchar(25)		not null
)
go

--insert values
insert into EmpInfo values(1,'Join',10000,'HR')
insert into EmpInfo values(2,'Girish',12000,'Sales')
insert into EmpInfo values(3,'Mannat',8000,'Sales')
insert into EmpInfo values(4,'Salaman',14000,'HR')
insert into EmpInfo values(5,'Ratan',9000,'HR')
insert into EmpInfo values(6,'Peter',12000,'Sales')
go

--See The tables
select * from EmpInfo
go

--
select E.EmpName, Avgsalary,EID,E.DeptName
from EmpInfo as E
join
			(	
			select DeptName,AVG(salary) as Avgsalary
			from EmpInfo
			group by DeptName
			) As K
on E.DeptName=k.DeptName
where salary > Avgsalary
go