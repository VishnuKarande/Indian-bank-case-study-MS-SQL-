use INDIAN_BANK
go

-----------------------------Scelar Function----------------------------------
Alter function fn_GetCoustomers
(
	@Acid int 
)
returns money
as 
begin
		declare @x money

		select @x=CBalance
		from AccountMaster
		where ACID=@ACID

	return isnull (@x,0)
end
go

--Call the funtion
select dbo.fn_GetCoustomers (1010) as Balance
go

--------------------------Inline Function------------------------------------
create function Fn_GetBrachaCustomers
(
	@BRID Char(4)
)
returns table
as 
Return
	(
	select * from  AccountMaster
	where BRID = @BRId
	)
go

--Call the inline function 
select * 
from dbo.Fn_GetBrachaCustomers ('BR1')

--Can i join Function and table / views
--yes Expnletion is giving blows
select * 
from dbo.Fn_GetBrachaCustomers ('BR2') as a join TransactionMaster as b
on a.ACID = b.ACID
go
