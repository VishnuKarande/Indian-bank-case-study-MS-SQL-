--Use Db
use INDIAN_BANK
go


--Create View
create view vw_GetBrachWiseCustomers_Count
as 
	select BRID,count(*) as Cnt
	from AccountMaster
	group by BRID
	go

--Viwe code  
sp_helptext 'vw_GetBrachWiseCustomers_Count'
go

--Call The view
select * from vw_GetBrachWiseCustomers_Count
go

--when all tab clear and i wanted to Branch_wise_cout
--Call view
select * from vw_GetBrachWiseCustomers_Count
go

--Max
select *
from vw_GetBrachWiseCustomers_Count
where cnt =(select Max(cnt) from vw_GetBrachWiseCustomers_Count)
go 

--View Always gets fresh Data
select *
from [dbo].[vw_customers_BR1]
go

--Update
update AccountMaster
set Name = 'Sandeep'
where ACID =105
go

-----------------------------------------------------------------------------------------------------------------------------------
Use INDIAN_BANK
go

--Origial table
select * from AccountMaster
go

--View Table
select * from vw_customers_BR1
go

--insert account values Original table
insert into AccountMaster values(109,'Lenna','UK','BR1','FD',GETDATE(),2000,2000,'O')
go

-- insert into View Table
insert into vw_customers_BR1 values(1,'Rahul','SAngali','BR1','SB',GETDATE(),3000,4000,'O')
go

update AccountMaster
set ACID = 110
where NAME ='Rahul'
go

--Data insert into using BR3 using Br1 
insert into vw_customers_BR1 values(111,'ANIl','Solapur','BR3','RD',GETDATE(),3100,4200,'O')
go

--------------------------------Non-Updateabel-----------------------------------
select * from vw_GetBrachWiseCustomers_Count
go

sp_helptext 'vw_GetBrachWiseCustomers_Count'
go
