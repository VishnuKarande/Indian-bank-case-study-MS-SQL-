use INDIAN_BANK
go

--see the Data
select * from AccountMaster
go

--TOP(N)
select top (5) * from AccountMaster
go

--percent
select top(5) percent * from AccountMaster
go

select 8*5.0/100

select top 10 * 
from AccountMaster 
order by CBalance asc

--latest rows
select top 10 *
from AccountMaster
order by Doo desc

--QUE
select DATEPART(MM,DOO) as MonthNO, count(*) as CNT
from AccountMaster
where DATEPART(YY,DOO)=2018
Group by Datepart (mm,doo)
--datename
select DATEname(MM,DOO) as MonthNO, count(*) as CNT
from AccountMaster
where DATEPART(YY,DOO)=2018
Group by Datename (mm,doo)
--datepart,datename
select DATEPART(MM,DOO) as MonthNO,DATENAME(mm,DOO) as MonthNAME, count(*) as CNT
from AccountMaster
where DATEPART(YY,DOO)=2018
Group by Datepart (mm,doo),DATENAME(mm,DOO)
order By 1 asc

--product wise no of customer in Branch BR1
--using Haveing
select PID ,COUNT(*) as CNT
from AccountMaster
where BRID = 'BR1'
group by PID
Having count(*) > 2
--haveing
select PID,sum(CBalance) as ToatlBal
from AccountMaster
where BRID='BR1'
group by PID
having sum(CBalance) >200
--que
select BRID,sum(CBalance) as TotalBalance,DateName(MM,DOO) as MOnthName,DATEPART(MM,DOO) as MonthNO
from AccountMaster
where DATEPART(MM,DOO)=1 
group by BRID,DATENAME(MM,DOO),DATEPART(MM,DOO)
having sum(CBalance) > 5000
--Que
--Not recommended
select BRID,sum(CBalance) as tobal_Balance,DATENAME(MM,DOO) as MonthName
from AccountMaster
where DATEPART(MM,DOO)=1
group by BRID,DATENAME(MM,DOO)
having BRID ='BR1'
go
		--OR
select BRID,sum(CBalance) as total
from AccountMaster
where DATEPART(MM,DOO)=1 and BRID='BR1'
group by BRID
go

--into table name create table is permently
select BRID,sum(CBalance) as total into NEW_TABLE
from AccountMaster
where DATEPART(MM,DOO)=1 and BRID='BR1'
group by BRID
go
--see the new table 
select * from NEW_TABLE
go

select * , DATEDIFF(yy,doo,GETDATE()) as ageofaccount into age_of_account
from AccountMaster
where DATEDIFF(yy,doo,GETDATE()) = 0
--see the data
select * from age_of_account
go

--create Tempary Table using #
select * into #AM_NEW from AccountMaster
where 1 =2
 
--create tabel usin into 
select *  into AM_BKP_20012022
from AccountMaster
go

drop table AM_BKP_20012022
go
--interview Que (diff Betn org.table and into table)

--create blank table
select * from AccountMaster
where ACID=1 --(using this logic create a blank table)
--create blank table
select * into AM_NEW from AccountMaster
where 1 =2
--see the Data
select * from AM_NEW
go

