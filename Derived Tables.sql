use INDIAN_BANK
go

--Que- list acid,name,and no of txns where done more than 3 Trasation for year 2011?

select * from AccountMaster
select * from TransactionMaster
go
--Join
select a.ACID,NAME, count(*) as Cnt
from AccountMaster as a join TransactionMaster as t
on a.ACID = t.ACID
where DATEPART(yy,DOTran) = 2019
group by a.acid,name
go

--Derived Table
select a.ACID,Name,No_of_Txns
from 
	AccountMaster as A
	join
			(
				select ACID,count(*) As No_of_Txns
				from TransactionMaster
				where DATEPART(yy,DOTran) = 2019
				group by ACID
			) as T
on a.ACID = T.ACID
go



