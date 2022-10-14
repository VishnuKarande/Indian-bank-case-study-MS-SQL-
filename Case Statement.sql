use INDIAN_BANK
go

--Case Statement systanx
select	ACID,
		NAME,
		CBalance,
		case
			when CBalance < 1000	then 'Siliver'
			when CBalance between 5000 and 7000 then 'Gold'
			else 'Platinum'
		end as custType
from AccountMaster 
