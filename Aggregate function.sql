use INDIAN_BANK
go
--Read The Data
select * from AccountMaster
go

--Find the no of rows
select count(*) as 'NO of Constomer' from AccountMaster
go

--find costomers in BR1 using Where
Select count(*) 'NO of Coustomer'
from AccountMaster
where BRID='BR1'
go

--find costomers in BR1 using BR1 and BR2
select count(*) 'NO of Customers'
from AccountMaster
where BRID='BR1' or BRID='BR2'
			--OR
select count(*) 'NO of Customers'
from AccountMaster
where BRID in ('BR1', 'BR2','BR6','BR4')
go

--Find The Total Balance
select sum(CBalance) 'Total Balance'
from AccountMaster

select sum(CBalance) 'Total Balance'
from AccountMaster
where BRID='BR1'
go

select MAX(CBalance) as MaxBal
from AccountMaster

select min(CBalance) as MinBal
from AccountMaster
go

select 
	count(*) as 'NO of Customers',
	Max(CBalance) as MaxBal,
	Min(CBalance) as minBal,
	Avg(CBalance) as AvgBal,
	sum(CBalance) as TotalBal
from AccountMaster