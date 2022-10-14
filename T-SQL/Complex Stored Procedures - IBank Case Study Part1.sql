use INDIAN_BANK
go
--Output is table format, but i dont need this table fromat
--use SP


-------------------------------------------------------
 /*************************************************************************************
SP_Name	: previousmonthBankStatement  
Author	: Vishnu Karande
Date	: Feb 3rd 2022 
DB		: INDIAN BANK
Purpose : Its will get previous month Trasnation donr by given customers.
---------------------------------------------------------------------------------------
SLNo	Done by			Date of change			Remarks
1		vishnu			jane 2, 2022			new sp
2		RAj				Feb 7 ,2022				modified and added Tax col in the sp
3		Aksaay			March 2,2022			modified And added.....
****************************************************************************************/
Alter Proc usp_previousmonthBankStatement
( 
		@acid int = 101
)
as
begin
		declare @CustName Varchar(40)
		declare @pid char(2)
		declare @brid char(3)
		declare @balance money

		declare @Rno int
		declare @Dotran datetime
		declare @TXNTYPE char(3)
		declare CHQNO int
		declare @TXNAMT money

		print'--------------------------------------------------------------------------------------------------'
		print '                       INDAIN BANK                              '
		print 'List of Transaction from 1st to 28, 2019 Report'
		print'--------------------------------------------------------------------------------------------------'
		
		--1:Customer Info
		select  @CustName = Name,
				@brid=brid,
				@pid=pid,
				@balance =CBalance
		from AccountMaster
		where Acid = @acid

	--print The Variables
	print'Product Name	:' + @pid
	print'Account No	:'+Cast(@acid as Varchar) + space(12)+'Branch			:'+@brid
	print'Custimer Name	:'+@CustName			  + space(6)+'Cleared Balance	:'+	Cast(@Balance as Varchar) + ' INR'

	print'--------------------------------------------------------------------------------------------------'
	print'SL.No		DOT		TXN TYPE	CHQUE_NO	AMOUNT		RUNNING_BALANCRE'
	print'--------------------------------------------------------------------------------------------------'

	--3.Get perivious month Txnx down by the given customer
	select ROW_NUMBER() over (order by DOTran asc)as Rno,DOTran,TXN_TYPE,CHQ_NO,TXN_AMOUNT into #Tnxtable
	from TransactionMaster
	where DATEDIFF(yy,Dotran,GETDATE()) = 3 and ACID = 103

	--4)print the data from table
		
	declare @x int
	set @x =1

	declare @cnt int
	--condition
	select @cnt = count(*) from #Tnxtable

	--loop syntax
	while (@x <= @cnt)
		begin
				select	@Rno = RNO,
						@DOTran=Dotran,
						@Txntype = TXNTYPE,
						@CHQNO = CHQNO,
						@TXNAMT = TXNAMT
				FROM #Tnxtable where Rno = @x
					--print the data
					print cast(@Rno as varchar)+ space(5)+
					convert(varchar,@DOtran,107)+space(10)+
					@TXNTYPE+space(10)+cast(isnull (@CHQNO,0) as varchar)+
					space(8)+cast(@TXNAMT as varchar)

	--incr
	set @x = @x =1

	end --End Loop
print'--------------------------------------------------------------------------------------------------'

end
go