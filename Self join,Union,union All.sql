--SELF REFEENTIAL TABLE	
Create table EMP
(
	EID			int				primary key,
	Name		varchar(10)		Not null,
	MID			int				null foreign key references EMP(EID)
)
go

--insert into account values
insert into EMP values(1,'Bill Gates',null)
insert into EMP values(2,'john',1)
insert into EMP values(3,'vishnu',1)
insert into Emp values(4,'Raj',2)
insert into Emp values(5,'Ankita',3)
go

--see the table
select * from EMP
go
--self join
--list EMP name and their manegar name
select e1.Name as Empname, e2.Name as bossName , e1.MID
from EMP as e1 left join EMP as e2 
	on e2.EID = e1.MID
go

--union or unioun all
--Like

