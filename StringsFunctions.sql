--create table
create table Customer
(
	cid			int				Primary key,
	name		varchar(100)	not null,
	phoneno		char(10)		not null check(len(phoneno)=10) unique,
	dob			datetime		not null check (datediff(yy,dob,getdate()) >=21  and datediff(yy,dob,getdate())<=58)
)
go

--insert values into table
insert into Customer values(1,'vishnu','9175687261','1990/12/22')
insert into Customer values(2,'Askshay','9609161738','1977/1/17')
insert into Customer values(3,'Raj','9503718181','1988/11/27')
insert into Customer values(4 ,'vishnu','9291381181','2005/2/21')
go

--see the table
select * from Customer
go

--SubString
select * from AccountMaster
go

--------------------------------------------SubString-------------------------------
select ACID,
	   NAME,
	   SUBSTRING(Name,3,5) as Name  --Vishnu o/p -shnu
from AccountMaster
go

------------------------------------Reverse-----------------------------------
select ACID,
	   NAME,
	   reverse(Name) as Name	--unhsiV
from AccountMaster
go 
--i want to reverse only 4 values 
select ACID,
	   NAME,
	   SUBSTRING(Name,1,4) as SUBSTRING_Name,
	   reverse(Name) as reverseName,
	    SUBSTRING (reverse(Name),3,4) as Last_2Name
from AccountMaster
go

---------------------------------------STUFF------------------------------------------
select ACID,
	   NAME,
	   STUFF(NAME,3,3,'zz')			----Vizzu
from AccountMaster
go 

--Ex 2
select ACID,
	   NAME,
	   STUFF(NAME,1,3,'zz')			
from AccountMaster
go 

select ACID,
	   NAME,
	   STUFF(NAME,2,4,'zz')			----Vizzu
from AccountMaster
go

------------------------------------------repalce-------------------------------------- 
select ACID,
	   NAME,
	   STUFF(NAME,2,4,'zz') AS Stuff_name, --Vzzu
	   replace (NAME,'i','XXX') as ReplaceName --VXXXshnu
from AccountMaster
go

--------------------------------------space() -------------------------------------------------
create table EMP4
(
	EID				INT				primary key,
	Fname			varchar(100)	not null,
	LName			varchar(100)	not null

)
go

insert into EMP4 values(1,'Bhaskar','Jogi')
insert into EMP4 values(2,'vishnu','karande')
insert into EMP4 values(3,'Raj','Hode')
go

select * from EMP4
go

--using space 
select Fname+space(1)+LName as FullName     --Bhaskar Jogi
from EMP4
go

---------------------charindex(Find the position)--------------------------- 
--QUE-i wnat find out the positon of 'space'
select CHARINDEX (' ','vishnu karande') --o/p 7
go
--QUE-i wnat find out the positon of 'u' 
select CHARINDEX('u','vishnu karande')	--6
go
--i want to find out secound 'i'?  --output is 8  
select CHARINDEX('i','ihello iworld',3)
go

--find out postion od 'O' in table
select NAME, 
	  charindex('i',NAME) as position_number_of_i
from AccountMaster
go

--anywhere 'i'
select Name,charindex('i',name) as No_of_position
from AccountMaster
where name like '%i%'
go

--anywhere not i
select Name,charindex('i',name) as No_of_position
from AccountMaster
where name not like '%i%'
go

--QUE-find the email is correct or not
--if it return 0 --invalid
select CHARINDEX('@','rajhode.com') as position_number_for_@
--0
go

select CHARINDEX('@','rajhode@.com') as position_number_for_@
--8
go

------------------------------------------PATINDEX------------------------------------------
select PATINDEX('%reach%','all Guys ensure that, reach class on time')  --23
go
