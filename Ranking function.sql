use INDIAN_BANK
go

--Row_Number()
select	ACID,NAME,CBalance,BRID,ROW_NUMBER() 
		over(order by acid)
from AccountMaster
go

--Gets 5th Rows
select * 
from 	(
			select ACID,NAME,CBalance,ROW_NUMBER() over(order by acid asc) as RNo
			from AccountMaster 
		)as k
where RNo = 5
go

--partition by
select ACID,NAME,CBalance,BRID,ROW_NUMBER() over (partition by BRID order by acid ) as Rno
from AccountMaster
go

--we wanted have 1st row in each brach
select
* from
		(
		select ACID,NAME,CBalance,BRID,ROW_NUMBER() over (partition by BRID order by acid ) as Rno
		from AccountMaster
		) as K
where BRID='BR1'
go

--Every 5th Row in coloume
select acid,NAME,BRID,Rno
from	(
			select *, Row_number() over( partition by BRID order by acid ) as Rno
			from AccountMaster
		) as k
where Rno %2=0 
go
-----------------------------------Rank()--------------------------
select	ACID,NAME,CBalance,BRID, 
		RANK() over(order by cbalance desc) as RankNO,
		DENSE_RANK() over(order by cbalance desc) as Dense_Rank
from AccountMaster
go

--who is having highest balance is bank
select *
from (
		 select	ACID,NAME,CBalance,BRID,
				DENSE_RANK() over (order by Cbalance desc) as RankNO
		from AccountMaster
	)as K
where RankNO =1
go

--Partition By
--Dense Ranking
select	acid,NAME,CBalance,BRID,
		DENSE_RANK() over (partition by cbalance order by cbalance desc) as Rank_No		
from AccountMaster
go

--brach Wise Highest Balance Coustomer
select *
from
		(
		select	acid,NAME,CBalance,BRID,
				DENSE_RANK() over (partition by BRID order by cbalance desc) as RNno
				from AccountMaster) as K
where RNno=1
go

-------------------------------------Ntile()------------------------------
--i wanted into 2 group
select	ACID,NAME,CBalance,BRID,
		NTILE(2) over (order by acid desc) group_NO
from AccountMaster
go

--splite the data into two group in i wanted to only 1 group
select *
from 
	(
		select	ACID,NAME,CBalance,BRID,
				NTILE(2) over (order by acid desc) as group_NO
		from AccountMaster
	) as K
where group_NO=1
go

--with in BRID i want two group
select *
from 
	(
		select	ACID,NAME,CBalance,BRID,
				NTILE(2) over (partition by BRID order by acid asc) as group_NO
		from AccountMaster
	) as K
where group_NO=1
go









