--Temp Tables
create table #Emp
(
		EID		Int				primary key,
		name	varchar(100)	not null,
		Gender	char(10)		not null
)
go

--see the table
select * from #Emp
go
--insert table value
insert into #Emp values(1,'vishnu','m')
insert into #Emp values(2,'Raj','f')
insert into #Emp values(3,'Akashay','m')

--Global Temp Table
create table ##Emp
(
		EID		Int				primary key,
		name	varchar(100)	not null,
		Gender	char(10)		not null
)
go

--see the table
select * from ##Emp
go

--insert values
insert into ##Emp values(1,'ABC','m')
insert into ##Emp values(2,'PQR','f')
insert into ##Emp values(3,'XYZ','m')
ho

------------------------------Temp Table-------------------------







