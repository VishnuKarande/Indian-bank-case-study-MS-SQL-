USe INDIAN_BANK
go
--exec [dbo].[usp_previousmonthBankStatement] 103

--sp_helptext usp_previousmonthBankStatement

--Output is table format, but i dont need this table fromat  
--use SP  
  
  
-------------------------------------------------------  
 /*************************************************************************************  
SP_Name : previousmonthBankStatement    
Author : Vishnu Karande  
Date : Feb 3rd 2022   
DB  : INDIAN BANK  
Purpose : Its will get previous month Trasnation donr by given customers.  
---------------------------------------------------------------------------------------  
SLNo Done by   Date of change   Remarks  
1  vishnu   jane 2, 2022   new sp  
2  RAj    Feb 7 ,2022    modified and added Tax col in the sp  
3  Aksaay   March 2,2022   modified And added.....  
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
  declare @CHQNO int  
  declare @TXNAMT money 
  
  declare @Lastmonth varchar(40)
  declare @TodaysDate datetime
  set @TodaysDate = GETDATE()

  --Gets last 3 latters in the month
  --declare @LastMonth_short varchar(3)
  --select @LastMonth_short=SUBSTRING(@Lastmonth,1,3)
  
  --Get The last month  
  select @Lastmonth=DATENAME(mm, DATEADD(yy,-1,@TodaysDate))
  --print @Lastmonth

  --Gets Last Month End Date
  declare @LastMonthEndDate datetime
  select @LastMonthEndDate= EOMONTH(DATEADD(mm,-1,@TodaysDate))

  
  print'--------------------------------------------------------------------------------------------------'  
  print '                       INDAIN BANK                              '  
  print 'List of Transaction from'+space(2)+@Lastmonth+space(1)+'1st to'+space(1)+convert(VArchar,@LastMonthEndDate,107)+space(1)+ 'Report'  
  print'--------------------------------------------------------------------------------------------------'  
    
  --1:Customer Info  
  select  @CustName = Name,  
    @brid=brid,  
    @pid=pid,  
    @balance =CBalance  
  from AccountMaster  
  where Acid = @acid  
  
 --print The Variables  
 print'Product Name :' + @pid  
 print'Account No :'+Cast(@acid as Varchar) + space(12)+'Branch   :'+@brid  
 print'Custimer Name :'+@CustName     + space(6)+'Cleared Balance :'+ Cast(@Balance as Varchar) + ' INR'  
  
 print'--------------------------------------------------------------------------------------------------'  
 print'SL.No	 DOT		TXN TYPE	CHQUE_NO AMOUNT		RUNNING_BALANCRE'  
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
 select  @cnt =count(*) from #Tnxtable  
  
 --loop syntax  
 while (@x <= @cnt)  
  begin  
    select	@Rno = RNO,  
			@DOTran=Dotran,  
			@Txntype = TXN_TYPE,  
			@CHQNO = CHQ_NO,  
			@TXNAMT = TXN_AMOUNT      
      FROM #Tnxtable where Rno = @x  
     --print the data  
     print cast(@Rno as varchar)+ space(5)+  
     convert(varchar,@DOtran,107)+space(5)+  
     @TXNTYPE+space(10)+cast(isnull (@CHQNO,0) as varchar)+  
     space(18)+cast(@TXNAMT as varchar)  
  
 --incr  
 set @x = @x +1  
  
 end --End Loop  
print'--------------------------------------------------------------------------------------------------'  
 
	declare @NoTxns int
	select @NoTxns = COUNT(*) from #Tnxtable
	print'Total NUmber of Transaction		:'+cast (@NOTxns as varchar)

	declare @CDs int
	select  @CDs = COUNT(*) from #Tnxtable
	where TXN_TYPE = 'CD'
	print'Number Of Cash Desposits		:'+cast(@cds as varchar)
	
	--select * from #Tnxtable
	--declare @CDs int
	--select @CDS=count(*) from #Tnxtable
	--where TXN_TYPE ='CD'
	
	declare @CWs int
	select  @CWs = COUNT(*) from #Tnxtable
	where TXN_TYPE = 'CW'
	print'Number Of Cash Desposits		:'+cast(@CWS as varchar)

	declare @CQD int
	select  @CQD = COUNT(*) from #Tnxtable
	where TXN_TYPE = 'CHQ'
	print'Number Of Cash Desposits		:'+cast(@CQD as varchar)

	print'--------------------------------------------------------------------------------------------------'  
	print'Thanks for Banking us. for more help..Call our Customer Care:1800 122 100'
	print'--------------------------------------------------------------------------------------------------'  

end  
GO

--SELECT * FROM TransactionMaster 
--SELECT * FROM AccountMaster