--Running Total
select acid,Name,BRID,Cbalance,Ubalance,
	sum(CBalance) over (partition by BRID order by acid) as Running_tables
from AccountMaster
--over is Window Function