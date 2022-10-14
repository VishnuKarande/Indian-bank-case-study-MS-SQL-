 ---------------------------nullif------------------------
 use INDIAN_BANK
 go

select * from AccountMaster
go

--same value
select nullif(4,4) as result --NULL
--Give Different values
select nullif(10,5) as result  -- gets 1st value--10
go

--use tables
select * from AccountMaster
go

select	NAME,
		CBalance,
		UBalance,
				nullif(CBalance,UBalance) as Balance
from AccountMaster
go

------------------------------SubQurey------------------------------------
-----------------subquery(or)Nasted Query(or)Inner Query-----------------------------
--Que-Who has highest balance in bank

select Name,Cbalance
from AccountMaster
group by name,Cbalance     --All Data
order by CBalance desc
go

--Secoun WAY
select max(CBalance)   --9000.00
from AccountMaster
go

--above this two code are invalid
--We want only NAME
select name
from AccountMaster										--Nilesh
where Cbalance =(select MAX(Cbalance)from AccountMaster)
go 

--Who has the 2nd Hoghest Balance in the Bank?
select ACID,Name,CBalance
from AccountMaster
where CBalance =(
					select MAX(CBalance)
					from AccountMaster			--7000.00 
					where CBalance < (select MAX(CBalance) from AccountMaster) 
)
--Output--104	Ajay	A/p mumbai	BR6	SB	2020-10-03 00:00:00.000	7000.00	4000.00	I
		--107	Uttakatsh	pune	BR6	RD	2022-01-18 10:58:10.437	7000.00	9000.00	O
go

--Who has the highest 10th balance in the bank?
select * 
from AccountMaster
where CBalance=(
					select min(Cbalance)
					from AccountMaster
					where CBalance in(
									select distinct TOP 1 CBalance
									from AccountMaster
									order by CBalance desc
									)
				)
go

