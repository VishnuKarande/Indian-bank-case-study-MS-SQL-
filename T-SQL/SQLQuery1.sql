use INDIAN_BANK
go

-- Account Deatails in BR1
Select * from AccountMaster 
where BRID='BR1'
go

--Last 6 month no Trastion in made
update AccountMaster
set Status = 'I'
Select * from AccountMaster 
where acid not in(
					select ACID
					FROM TransactionMaster
					where DATEDIFF(MM,DOTran,GETDATE()) >= 6
				)
				go
---------------------------------View-------------------
--Create View
create view  vw_customers_BR1
as
Select * from AccountMaster 
where BRID='BR1'
go

--Call The view
--client
select * from vw_customers_BR1
go

--Last Six Month NO trastion
create View vw_NoTxnMade_Last6Monthe
as
Select * from AccountMaster 
where acid not in(
					select ACID
					FROM TransactionMaster
					where DATEDIFF(MM,DOTran,GETDATE()) >= 6
				)
go
--see the view
select * from vw_customers_BR1
go

--see the view code
sp_helptext'vw_NoTxnMade_Last6Monthe'
go
--You Want to Update the code
--copy and paste it
alter View vw_NoTxnMade_Last6Monthe  
as  
Select ACID,NAME,Status
from AccountMaster   
where acid not in(  
     select ACID  
     FROM TransactionMaster  
     where DATEDIFF(MM,DOTran,GETDATE()) >= 6  
    )
go

--see the alter table
select * from vw_NoTxnMade_Last6Monthe
go

--Drop view
drop view vw_NoTxnMade_Last6Monthe
go

--Gets all view Name
select * from sys.views
go
--count View(How many view in DB)
select count(*) from sys.views
go
--Gets all view Name
select * from sys.procedures
go
--How many view in DB
select count(*) from sys.procedures
go

---------------------------------proc----------------------------
create proc usp_Update_status
as
begin
update AccountMaster
set Status = 'I'
Select * from AccountMaster 
where acid not in(
					select ACID
					FROM TransactionMaster
					where DATEDIFF(MM,DOTran,GETDATE()) >= 6
				)
end
go


