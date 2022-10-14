use INDIAN_BANK
go


--All Table info 
--system table 
select * from sys.tables
go

--I want to how mant tables in DB
select count(*) as NoofTables 
from sys.tables
go

--All cols in a DB
select * from sys.columns
where object_id=837578022
go

--find out  no cols of AM Tables
select count (*) from sys.columns
where object_id=837578022
go

--Using SubQuery
select *
from sys.columns
where object_id = (select object_id from sys.tables  where name= 'AccountMaster')
go

--NO of cols in the AM DB
select *
from sys.tables
where object_id = (select object_id from sys.tables  where name= 'AccountMaster')
go

--indentify the tables
select b.name as TableName,a.name as cols_name
from sys.all_columns as a join sys.tables as b
on a.object_Id = b.object_id
where a.name = 'Cbalance'
go

--check Emp table are Exist or not
select * from sys.tables
where name ='EMP4' 
go

--Gets all Database
select * from sys.databases
go

--New get all tables using Clause
--concat
select * from sys.tables
select 'hi' + name from sys.tables
select 'Select * from ' + name  from sys.tables
go



