use master
go

/*************************************************
Name	:Code for supplier DB
Author	:Vishnu Karande
Data	:2022-01-12 19:03:34.087

purpose	:This Script will Create DB and few table in it
		info supply

**************************************************/
--Create Database
create database Supplier
go

--change DB Context
use Supplier
go

--SupplierMaster
create table SupplierMaster
(
	SID		int				primary key,
	NAME	varchar(40)		not null,
	CITY	char(6)			not null,
	GRADE	Tinyint			not null check(GRADE>0 and GRADE<=4)
)
go

--see The DB
select * from SupplierMaster
go

--see the schema
sp_help SupplierMaster
go

--insert The value in table
insert into SupplierMaster values (10,'Usman khan','Delhi',1)
insert into SupplierMaster values (20,'NItish k','mumbai',2)
insert into SupplierMaster values (30,'Ram','USA',1)
insert into SupplierMaster values (40,'RAj','HYD',4)
insert into SupplierMaster values (50,'Akshay','Nagar',3)
insert into SupplierMaster values (60,'Iwser','Nasik',4)
go

--PartMaster
create table PartMaster
(
	PID			TinyInt			Primary Key,
	NAME		Varchar(40)		NOT NULL,
	PRICE		Money			NOT NULL,
	CATEGORY	Tinyint			NOT NULL,
	QTYONHAND	Integer			NULL
)
go

--read the Data
Select * from PartMaster
go

--insert The data
insert into PartMaster values(1,'Light',1000,1,1200)
insert into PartMaster values(2,'Batteries',5600,1,500)
insert into PartMaster values(3,'Engine',67000,2,4000)
insert into PartMaster values(4,'Tyres',2400,3,5000)
insert into PartMaster values(5,'Tubes',700,3,7800)
go

insert into PartMaster values(6,'Screws',12,2,200)
insert into PartMaster values(7,'Mirrors',450,2,3450)
go

--SupplyDetails
create table SupplyDetails
(
	PID				TinyInt		not null Foreign Key references PartMaster(PID), 
	SID				Integer		not null Foreign Key references SupplierMaster(SID),
	DATEOFSUPPLY	DateTime	NOT NULL,
	CITY			Varchar(40)	NOT NULL,
	QTYSUPPLIED		Integer		NOT NULL
)
go

--read the data
select * from SupplyDetails
go

--insert tha data
insert into SupplyDetails values (2,30,'2019/4/21','Pune',45)
insert into SupplyDetails values (3,10,'2019/5/23','mumbai',25)
insert into SupplyDetails values (1,40,'2019/5/27','Kolkata',120)
insert into SupplyDetails values (5,50,'2019/6/29','Pune',45)
go
insert into SupplyDetails values (6,30,'2019/7/9','Sagali',100)
insert into SupplyDetails values (7,20,'2019/7/10','Delhi',30)
go 
--delete all Data
delete from SupplyDetails