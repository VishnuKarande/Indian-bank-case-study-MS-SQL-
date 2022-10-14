use INDIAN_BANK
go


Create proc usp_GetCustomerInfo
(
	@acid int,
	@CustName varchar(40) out,
	@Balance money out
)
as 
begin


if exists (Select * from AccountMaster where acid=@acid)
	select @CustName=Name,@Balance=CBalance from AccountMaster where ACID = @acid

else
	print 'You ACID is Invalid.Please Check The Account Numbers'
end
go
--
declare @name varchar(40)
declare @bal money
Exec usp_GetCustomerInfo 101,@name out , @bal out
--print @name
--print @bal
select @name
select @bal