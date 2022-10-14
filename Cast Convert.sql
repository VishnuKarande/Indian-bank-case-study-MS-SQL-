Use INDIAN_BANK
go

--see table
select * from AccountMaster
go

--print cols and Constants
select ACID,NAME,CBalance,' USD' as Currency, 18 as Tax
from AccountMaster

--concat cols
--use + symbol
select ACID,NAME,CBalance + 'USD'as Currency
from AccountMaster
go
--cast
select ACID,NAME,cast (CBalance as varchar) + ' USD'as Currency
from AccountMaster
--OR
select ACID,NAME,'USD'+ cast (CBalance as varchar) as Balance
from AccountMaster

--Convert
select ACID,NAME,'USD'+ convert (varchar ,CBalance ) as Balance
from AccountMaster
--Convert
Select *
from AccountMaster
go

--Convert
Select ACID,NAME,DOO,convert(varchar,doo) as AsopanDate
from AccountMaster --Oct  3 2018 12:00AM

--style no (1,2,3)
Select ACID,NAME,DOO,convert(varchar,doo,1) as AsopanDate
from AccountMaster --10/03/18

Select ACID,NAME,DOO,convert(varchar,doo,2) as AsopanDate
from AccountMaster --18.10.03

Select ACID,NAME,DOO,convert(varchar,doo,3) as AsopanDate
from AccountMaster --03/10/18

Select ACID,NAME,DOO,convert(varchar,doo,4) as AsopanDate
from AccountMaster --03.10.18

select ACID,NAME,DOO,convert(varchar,DOO,107) as AsopanDate
from AccountMaster