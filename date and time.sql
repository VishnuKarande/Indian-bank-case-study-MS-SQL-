use INDIAN_BANK
go

--1)Getdata()
select GETDATE() as Todaydate
select GETDATE() -1 as YesterdaysDate
go

--print Different style
--Convert
select CONVERT(varchar,GETDATE())  --Jan 17 2022 10:10PM
select CONVERT(varchar,GETDATE(),1)  --01/17/22
select convert(varchar,GETDATE(),2)  --22.01.17

select ACID,NAME,Cbalance,GETDATE() as As_on
from AccountMaster
go

--2) DateDiff()
select datediff (yy,'2024/12/31',GETDATE()) --(-2)
select datediff (yy,'2020/12/31',GETDATE() )  --2
select datediff(mm,'2020/12/21',GETDATE())	--13
select datediff(WW,'2020/12/21',GETDATE())-- 56
select datediff(DD,'2020/12/21',GETDATE())

--MY Brith day
select DATEDIFF (yy,'1997/10/29',GETDATE() )
as MY_Age

--What is age of each account
select ACID,NAME,Cbalance,doo, DATEDIFF(yy,doo,GETDATE() ) as Ageofcoloume
from AccountMaster
go

--See the Tablevalues
select * from AccountMaster
go

--I need To update the values from live date
update AccountMaster
set doo=GETDATE()
where ACID=108

update AccountMaster
set doo=GETDATE()
where ACID=107

update AccountMaster
set doo=GETDATE()
where ACID=101

--List of the account, opaned in the Current year
select ACID,Name,Cbalance,doo, DATEDIFF(yy,doo,GETDATE())
from AccountMaster
where DATEDIFF(yy,doo,GETDATE()) = 0

--List of the account, opaned in the Current month
select ACID,Name,Cbalance,doo,DATEDIFF(mm,doo,GETDATE() )
from AccountMaster
where datediff (mm, doo,GETDATE()) =0
go
 
--How many coustomres opaned account in last 3 year?
select * 
from AccountMaster
where DATEDIFF(YY,DOO,GETDATE()) <=3
go

--Datepart()
select DATEPART(YY,'2022/4/19')
as yearpart --2022

select DATEPART(MM,'2022/4/19')
as MonthPart  --4

select DATEPART(DD,'2022/4/20')
as Daypart  --20
go

Select DATEPART(YY,GETDATE()) as CURRENT_YEAR
select DATEPART(mm,getdate()) as CURRENT_MONTH
select DATEPART(DD,getdate()) as CURRENR_DAYS
select DATEPART(HH,getdate()) as CURRENT_HOUR
select DATEPART(MI,getdate()) as CURRENT_MINUTE
go

--Year wise , no of account opaned
select DATEPART(yy, doo)as YNO,count(*) as CNT
from AccountMaster
Group by DATEPART(yy, doo)
go

--year of colletion
select DATEPART(yy,doo) as Yno, sum(CBalance) as Ycolletion
from AccountMaster
group by Datepart (yy,doo)

--list customers who opaned in 2022
select ACID,NAME,CBalance,datepart(yy,doo) as YearNO
from AccountMaster
where DATEPART(yy, doo) = 2022
go

--list customers who opaned in Apr 2022
select ACID,NAME,CBalance,datepart(yy,doo) as YearNO
from AccountMaster
where DATEPART(yy, doo) = 2022 and datepart (mm, doo) = 1
go

--DateName()
select datename(mm,GETDATE()) as Monthname  --January
select datepart(mm,GETDATE()) as Monthname	--1
select datename(dw,GETDATE()) as dayname	--Tuesday
go

--print only weekday S,M,T,F,T,T like that
select *,
DATENAME(dw,doo) as DayName
from AccountMaster
where DATENAME(DW,doo) = 'Friday'
go

-- Day(),month(),year()
select ACID,name,doo,
	DATEPART(yy,doo) as Yno,
	year(DOO) as YearNO,
	datepart(QQ,doo) as Qthno,
	month(DOO) as MONthno,
	day(doo) as daywise
from AccountMaster

--Year wise Qtr wise,MOonth wise Total balance
select	DATEPART(yy,doo) as YNO,
		'Q'+cast (DATEPART(QQ,DOO) as varchar) as QNO,
		DATEPART(mm,Doo) as Mno,
		sum(Cbalance) as TotalBalance
from AccountMaster
group by DATEPART(yy,doo),DATEPART(QQ,DOO),DATEPART(mm,Doo)
go

select	DATEPART(yy,doo) as YNO,
		'Q'+cast (DATEPART(QQ,DOO) as varchar) as QNO,
		DATEPART(mm,Doo) as Mno,
		sum(Cbalance) as TotalBalance
from AccountMaster
where BRID='BR1' and datepart(yy,doo)=2022
group by DATEPART(yy,doo),DATEPART(QQ,DOO),DATEPART(mm,Doo)
go

--Dateadd()(Denote Feacture Date)
select getdate() as Todaysdate		--2022-01-19 10:20:05.203
select DATEADD(DD,40,GETDATE())		--2022-02-28 10:20:05.203
go

--Day
select acid,name,cbalance,doo as PaidOn,DATEADD(DD,20,doo)
from AccountMaster
go

--month
select acid,name,cbalance,doo as PaidOn,DATEADD(MM,2,doo)
from AccountMaster
go

--EOMONTH
select EOMONTH('2021/1/10')
