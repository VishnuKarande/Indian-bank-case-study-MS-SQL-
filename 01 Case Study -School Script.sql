/***********************************************
Name		:Code for school DB
Author		: Vishnu Karande 
Date		:jan 12 2022

pruprose	:This script will create Db and few table in it to 
			store info of School
***************************************************/

use master
go
--DB Create
create database School
go

--find out schema of db
sp_helpdb School
go

--Change the db context
use school
go
-- CourseMaster
create table CourseMaster
(
	CID				int				primary key,
	CourseName		varchar(40)		NOT null,
	Category		char(1)			NUll check(Category='B'or Category='M' or Category='A'),
	fee				smallmoney		NOT NULL check(fee > 0)	
)
go

--Schema of the table
sp_help CourseMaster
go

--read the table data 
select * from CourseMaster
go

--insert the Data in table
insert into CourseMaster values(10,'Java','B',5000)

insert into CourseMaster values(20,'Adv Java','a',25000)
insert into CourseMaster values(30,'Big DAta','A',40000)
insert into CourseMaster values(40,'SQL Server','M',20000)
insert into CourseMaster values(50,'Oracle','M',15000)
insert into CourseMaster values(60,'Python','B',15000)
insert into CourseMaster values(70,'MSBI','A',35000)
insert into CourseMaster values(80,'Data Secience','A',90000)
go

--update Data(insert into CourseMaster values(20,'Adv Java','a',25000)) 
update CourseMaster
set Category='A'
where CID=20
go

--StudentMaster
create table StudentMaster
(
	SID		TinyInt			Primary key,
	Name	varchar(40)		not null,
	Origin	Char(1)			not null check (Origin='L' or Origin='F'),
	Type	Char(1)			not null check (Type ='U' or Type='G')
)
go

--Read The Data
select * from StudentMaster
go

--insert data
insert into StudentMaster values (1,'Vishnu','F','G')
insert into StudentMaster values (2,'Durga parasad','L','U')
insert into StudentMaster values (3,'Geni','F','U')
insert into StudentMaster values (4,'Gopi Krishna','l','G')
insert into StudentMaster values (5,'Hemanat','L','G')
insert into StudentMaster values (6,'K Nitish','L','G')
insert into StudentMaster values (7,'Manisha','L','G' )
insert into StudentMaster values (8,'Priyanko','L','G')
insert into StudentMaster values (9,'RAJ','F','G')


--How to update primay key
update StudentMaster
set SID=9

-- Delete sigal row
delete from StudentMaster where SID=10
go

--EnrollmentMaster
create table EnrollmentMaster
(
	CID		int			not null Foreign Key References CourseMaster(CID),
	SID		Tinyint		not null Foreign Key References StudentMaster(SID),
	DOE		DateTime	not null,
	FWF		bit			not null,
	Grade	Char(1)		NUll check (Grade in('O','A','B','C'))
)
go

--see the data data
select * from EnrollmentMaster
go

--insert The Data
insert into EnrollmentMaster values (30,1,'2022/11/29',0,'o')
insert into EnrollmentMaster values (60,2,'2022/11/29',0,'O')
insert into EnrollmentMaster values (50,1,'2019/1/31',1,'A')
go

insert into EnrollmentMaster values (80,9,'2018/11/6',0,'B')
insert into EnrollmentMaster values (70,8,'2022/10/09',1,'C')
insert into EnrollmentMaster values (40,5,'2021/1/1',1,'O')
go

insert into EnrollmentMaster values (40,9,'2021/1/6',0,'A')
insert into EnrollmentMaster values (70,8,'2021/2/9',1,'C')
insert into EnrollmentMaster values (40,5,'2021/3/1',1,'O')
go

insert into EnrollmentMaster values (40,3,'2020/3/6',1,'O')
insert into EnrollmentMaster values (70,8,'2020/4/09',0,'C')
insert into EnrollmentMaster values (40,5,'2020/5/1',0,'B')

