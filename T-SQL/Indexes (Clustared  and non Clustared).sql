--Heap Table (Data is not structured)
create table testindex
(
		EID		Int,
		name	varchar(100)
)
go

--read the data from above table
select * from testindex
go

--find out index on a table
sp_helpindex testindex
go

--insert Data
insert into testindex values(100, 'Ramesh')
insert into testindex values(24, 'Raj')
insert into testindex values(98, 'Aksahy')
insert into testindex values(87, 'Kiran')
insert into testindex values(19, 'Join')
go

--see the data
select * from testindex
go

--read The Data randmonly
--Its uses, table scan since there is no 
--on this table
select * from testindex
where EID=87
go

insert into testindex values(20, 'Join')
insert into testindex values(101, 'Nilesh')
insert into testindex values(35,'Amey')
go


-------------------------With Indexs --------------------------
create table testIndex12
(
		EID			INT				primary key,
		Name		varchar(100)	not null
)
go

--insert the Data into table
insert into testindex12 values(100, 'Ramesh')
insert into testIndex12 values(24, 'Raj')
insert into testindex12 values(98, 'Aksahy')
insert into testindex12 values(87, 'Kiran')
insert into testindex12 values(19, 'Join')
insert into testindex12 values(20, 'Join')
insert into testIndex12 values(101, 'Nilesh')
insert into testindex12 values(35,'Amey')
go

--see The table
select * from testIndex12
go 

--see The Indexs
sp_helpindex testIndex12
go

-----------------------------------Create clusted index in manually-----------------------------
create table testindex
(
		EID		Int,
		name	varchar(100)
)
go

--Create Clustered indexs 

create clustered Index index_1_CI
on testindex
(
	EID
)
go

--insert The data
insert into testindex values(100, 'Ramesh')
insert into testindex values(24, 'Raj')
insert into testindex values(98, 'Aksahy')
insert into testindex values(87, 'Kiran')
insert into testindex values(19, 'Join')
go

--See The table
select * from testindex
go

--Dubalicate Data is allowed in clustered index
 --see The clustered index
sp_helpindex 'testindex'
go

--create clusted indexd on same table
create clustered Index index_2_CI
on testindex
(
	Name
)
--Msg 1902, Level 16, State 3, Line 104
--Cannot create more than one clustered index on table 'testindex'. Drop the existing clustered index 'index_1_CI' before creating another.

--Disable index

-----------------------------------------------------------------------------------------------
--table With Heap
create table Emp1

 







