use INDIAN_BANK
go

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

--How to function Scehma
sp_helptext 'dbo.fn_GetCoustomers'
go

--How to all view in system
select * from sys.views
go

--How to all Function in system 
select  * from sys.function
go
--Throwing Error-Incorrect syntax near the keyword 'function'

--How to see all function in the system
--Uesing super Table

select * from sys.objects
go

--for view
select * from sys.objects
where type= 'v'
go

--for PK
select * from sys.objects
where type= 'pk'
go

--For Fk
select * from sys.objects
where type= 'F'
go

--(IMP) For Function
select * from sys.objects
where type= 'Fn'
go
--All system informetion see the 2n type


