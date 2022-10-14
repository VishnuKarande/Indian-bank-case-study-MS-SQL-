Use INDIAN_BANK
go

--read the data 
select * from AccountMaster
go

--count the colms
select COUNT(ACID) from AccountMaster

--NO of Customers In BR1
select count(*) as cnt 
from AccountMaster
where BRID='BR1'

--NO of Customers In BR2
select count(*) as cnt
from AccountMaster
where BRID='BR2'

--NO of Customers In BR6
select count(*) as cnt
from AccountMaster
where BRID='BR6'
go

--Branch Wise no of customers
--Group by 
select BRID, count(*) as cnt
from AccountMaster
Group by BRID

select BRID, count(*) as cnt
from AccountMaster
where PID='SB'
Group by BRID

select Status , count(*) as cnt
from AccountMaster
group by Status
order by cnt desc
go

select PID,COUNT(*) as cnt
from AccountMaster 
group by PID
order by 1

--product wise no of product
select PID, sum(Cbalance) as Toatal, AVG(Cbalance) as [Avg bal], COUNT(*) as cnt
from AccountMaster
group by PID
go

--Group in Group
--Brancha wise, prod wise NO of customers  
select BRID,PID,COUNT(*) as cnt
from AccountMaster
Group by BRID,PID
Order by 1

select BRID,PID, SUM(CBalance) as TotalBalance
from AccountMaster
Group by BRID,PID
Order by 1
go
 
 --Brancha wise, prod wise NO of customers in theyear 2011
select year(DOO) from AccountMaster
go
--remove PID from select 
 select BRID, SUM(CBalance) as TotalBalance
from AccountMaster
where year(DOO)=2018
Group by BRID,PID
go

--List all Branches
Select BRID
from AccountMaster
group By BRID
go

--Recommended
Select Distinct BRID
from AccountMaster
go
--
--Find out Numbers Branch
select count(BRID) from AccountMaster --8
select COUNT(Distinct BRID) as [No OF barches]
from AccountMaster --6 






