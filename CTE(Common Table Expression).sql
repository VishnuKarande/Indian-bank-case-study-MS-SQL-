--CTE(Common Table Expression)
--Gets 1th Row
with k
as 
	(
		select	ACID,NAME,CBalance,BRID,
				ROW_NUMBER() over (order by acid asc) as RNO
		from AccountMaster
	)
select * from K
where RNO=1
go
--gets 5th row
with k
as 
	(
		select	ACID,NAME,CBalance,BRID,
				ROW_NUMBER() over (order by acid asc) as RNO
		from AccountMaster
	)
select * from K
where RNO=5
go

