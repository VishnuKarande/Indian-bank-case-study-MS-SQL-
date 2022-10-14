--Use DB
USE INDIAN_BANK
go


create proc usp_GetTxns
(
	@acid int,
	@Tenure tinyint
)
as
begin
		select * from AccountMaster where ACID =101

		select * from TransactionMaster
		where datediff(YY,DOTran,getdate())=3

		select TXN_TYPE ,count(*) as Cnt
		from TransactionMaster
		group by TXN_TYPE
end
go

--close it 
--i want modify it

sp_helptext 'usp_GetTxns'
--run it --copy it
go

Alter proc usp_GetTxns  
(  
 @acid int,  
 @Tenure tinyint  
)  
as  
begin 
	if exists (select * from AccountMaster where acid=@acid)
		begin 
			  select * from AccountMaster where ACID =@acid 
  
			  select * from TransactionMaster  
			  where datediff(YY,DOTran,getdate())=@Tenure and acid=@acid
  
			  select TXN_TYPE ,count(*) as Cnt  
			  from TransactionMaster
			  where datediff(yy,DOTran,GETDATE())=@Tenure and ACID=@acid
			  group by TXN_TYPE
		end
else
		begin 
				print 'Customer number is invalid'
		end
end
go

--closed it 
--call SP
exec usp_GetTxns 110,5
go



		    







