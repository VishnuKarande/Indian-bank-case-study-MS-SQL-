use INDIAN_BANK
go

--All Cols and all Rows
Select * from AccountMaster
go

--some cols and all rows
select ACID, name,BRID from AccountMaster
go

--All cols and some rows
select * from AccountMaster where BRID='BR5' or PID='FD' or Status='O'
go

-- some cols and  some rows
select ACID,name,PID from AccountMaster where PID='FD'
go

--sort
select * 
from AccountMaster
order by name desc

select *
from AccountMaster
order by name asc

select ACID,NAME,PID
from AccountMaster
where PID = 'SB' 
order by NAME asc
go

--correct/interview Que
select *,*
from AccountMaster

Select ACID,NAME,ACID,NAME,*
from AccountMaster

--It is valid
select 5

select 'JAVA'[Course Name]
go

--is it valid
select 5 as [MY LUCKY NUMBER]
from AccountMaster

select *,'Java',5
from AccountMaster
go

--purpose 
select ACID,NAME,CBalance,'USD' as Currency,'18%' as Tax
from AccountMaster
go

select ACID,NAME,'Is doing SQL Course With GOonline' as Status,*
from AccountMaster 

--concat
--Use + symbol
Select ACID,name + ' Is doing SQL Course With GOonline' as Status
from AccountMaster

--Valid
Select ACID,NAME,Cbalance +'INR' as Currency
from AccountMaster--Throw Error INT+STR not concat
--The below fun can be used to change the data type
--CAST(col as datatype )
--CONVERT(datatype,col,stylenum )
Select ACID,NAME,cast(Cbalance as varchar) +' INR' as Balance
from AccountMaster
			--OR
Select ACID,NAME,CONVERT (varchar,Cbalance) +' INR' as Balance
from AccountMaster


