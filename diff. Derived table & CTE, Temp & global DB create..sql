use INDIAN_BANK
go

--Table
select BRID,count(*) as Cnt
from AccountMaster
group by BRID 

--max
select BRID
from
		(
			select BRID,count(*) as Cnt
			from AccountMaster
			group by BRID
		) as K
where cnt = 
(
			select MAX(cnt)
			from
				(
					select BRID,count(*) as Cnt
					from AccountMaster
					group by BRID
				) as K
) 
go  	

------------------------------CTE--------------------------------
--Higest balance in BRID Wise
with k 
as 
(
	select BRID, count(*) as cnt
	from AccountMaster
	group by BRID
)
select BRID
from k
where cnt = 
			(select MAX(cnt) from k )
go

----------------------------------Temp DB--------------------------------
--table
select BRID,COUNT(*) as cnt 
from AccountMaster
group by BRID
go

--temp table
select BRID,COUNT(*) as cnt into #k
from AccountMaster
group by BRID
go

--1st BRID
select BRID 
 from #k
where cnt =(select Max(cnt) from #k)
go

--2nd BRID
select BRID 
from #k
where cnt =(
			select Max(cnt) from #k
			where cnt <(select max(cnt) from #k))
go

---------------------------Global DB(##)--------------------------
select BRID,COUNT(*) as cnt into ##k
from AccountMaster
group by BRID
go


 
