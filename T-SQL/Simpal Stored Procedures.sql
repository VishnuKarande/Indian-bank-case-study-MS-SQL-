use INDIAN_BANK
go

Exec usp_previousmonthBankStatement 110
go


-------------------------------------------------
use INDIAN_BANK
go

declare @acid int
set @acid =103
select * from AccountMaster
where ACID = @acid

--Tnx
select * from TransactionMaster
where  DATEDIFF(YY,DOTran,getdate()) = 3 and ACID = @acid
go