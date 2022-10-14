use INDIAN_BANK
go

Alter proc Usp_GetCustomer
(
	@BRID char(3)
)
as
begin
		select * from AccountMaster
		where BRID = @Brid

		select TXN_TYPE,sum(TXN_AMOUNT) as TotalAmt
		from TransactionMaster
		where BRID = @BRID
		group by TXN_TYPE
end
go

Exec Usp_GetCustomer 'BR1'
go