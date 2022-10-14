--Change the DB context
use INDIAN_BANK
go

--select the table 
select * from AccountMaster
select * from TransactionMaster
go

--joins 
select * 
from AccountMaster,TransactionMaster
where AccountMaster.ACID = TransactionMaster.ACID
go

--new syntax (ANST)-1992(SQL-92_Stntax)
select * 
from AccountMaster join TransactionMaster
	on AccountMaster.ACID = TransactionMaster.ACID
go
--using (as) function
select * 
from AccountMaster as AC join TransactionMaster as TM
	on AC.ACID = Tm.ACID
	--as is not compalsary
select * 
from AccountMaster  AC join TransactionMaster  TM
	on AC.ACID = Tm.ACID
go

--join 3 table
select * 
from AccountMaster AM join TransactionMaster TM
	on AM.ACID = TM.ACID
	join ProductMaster PM
	on pm.PID = AM.PID
go

--NEXT DAY 
--QUE-List of Namr of account holders and their Product Name
select NAME,ProductName 
from AccountMaster as AM join ProductMaster as PM
on AM.PID=PM.PID
go

--QUE(Find out coutmers Name Wise,Tnxtype,numbers of Tnx)
--using the table
select * from AccountMaster
select * from TransactionMaster
--Quries   
select name,TXN_TYPE,count(*) as cnt
from AccountMaster as AM inner join TransactionMaster as TM
on AM.ACID = TM.ACID
group by name,TXN_TYPE
go
--lastyear/lastday=1
--thismonth/thisyear=0  
select name,TXN_TYPE,count(*) as cnt
from AccountMaster as AM inner join TransactionMaster as TM
on AM.ACID = TM.ACID
where DATEDIFF(dd,DOTran,getdate())=0
group by name,TXN_TYPE
go

--Done by Year 2019 
select name,TXN_TYPE,count(*) as cnt,datepart(YY,DOTran) as year
from AccountMaster as AM inner join TransactionMaster as TM
on AM.ACID = TM.ACID
where Datepart(YY,DOTran)=2019
group by name,TXN_TYPE,datepart(yy,DOTran)
go

--joins
select distinct name,ProductName
from AccountMaster a inner join TransactionMaster t
	on a.ACID = t.ACID
	join ProductMaster as p
	on p.PID = a.PID
where TXN_TYPE = 'CD '  
go 

--Left Join
--matchted Data and Unmatched Data
select *
from AccountMaster a left join TransactionMaster t
	on a.ACID = t.ACID
	go

--how to get only unmatched data 
select *
from AccountMaster a left join TransactionMaster t
	on a.ACID = t.ACID
where TXN_TYPE is null 
go

--joins(i want only names) 
select name
from AccountMaster as A left join TransactionMaster as T
	on A.ACID = T.ACID
	where TranNO is null
go

--joins(i want only names and acid)
select name,ACID
from AccountMaster as A left join TransactionMaster as T
	on A.ACID = T.ACID
	where TranNO is null
go
--ERROR(Ambiguous column name 'ACID')
select name,A.ACID
from AccountMaster as A left join TransactionMaster as T
	on A.ACID = T.ACID
	where TranNO is null
go
 
--Matched Data 
select name,A.ACID
from AccountMaster as A left join TransactionMaster as T
	on A.ACID = T.ACID
	where TranNO is not null
go
--cross join 
select *
from AccountMaster, TransactionMaster
go
--select 8 * 6 =48
	--OR
select *
from AccountMaster, TransactionMaster
go






