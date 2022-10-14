use INDIAN_BANK
go

--Loop 
--Ex- i wanted to print 1000 numbers
--step: Initilize 
declare @x int
set @x = 1

--Condition
while (@x <= 10)
begin
	--Action
	print @x

	--Incr/Decr
	set @x = @x +1
end
go

--create Proc
create proc usp_printNumber
AS
	begin 
			declare @x int
			set @x = 1

		--Condition
			while (@x <= 100)
			begin
		--Action
			print @x

			--Incr/Decr
			set @x = @x +1
	end
end
go

--Call proc
exec usp_printNumber

--100 values put into table

--creat table
create table tbl_number
(
	id int
)
go

--see the table
select * from tbl_number
go

--insert into table
Alter proc usp_printNumber
AS
	begin 
			declare @x int
		set @x = 1

		--Condition
		while (@x <= 100)
		begin
			--Action
			--print @x
			insert into tbl_number values (@x )
			--Incr/Decr
			set @x = @x +1
	end
end
go

--Cal sp
exec usp_printNumber

--See The Table
select * from tbl_number
go 

--input values (User defined)
USE [INDIAN_BANK]
GO

ALTER proc [dbo].[usp_printNumber]
(
	@Start_val int,
	@end int
)
as 
	begin
		--Delete ALL rows
		Truncate table tbl_number
		--Condition
		while (@Start_val <= @end)
			begin
				--Action
				--print @x
				insert into tbl_number values (@Start_val)
				--Incr/Decr
				set @Start_val =@Start_val +1
			end
	end

--Call sp
exec usp_printNumber 5,20
go

-see table
select * from tbl_number

--------------------------------------------------------------------
--user Defined
USE [INDIAN_BANK]
GO

ALTER proc [dbo].[usp_printNumber]
(
	@Start_val int,
	@end int
)
as 
	begin
		--Delete ALL rows
		Truncate table tbl_number
		--Condition
		while (@Start_val <= @end)
			begin
				--Action
				--print @x
				insert into tbl_number values (@Start_val)
				--Incr/Decr
				set @Start_val =@Start_val +1
			end
	end

--Call sp
exec usp_printNumber 5,20
go

-see table
select * from tbl_number
----------------------------------------------------------------
--With table
USE [INDIAN_BANK]
GO

ALTER proc [dbo].[usp_printNumber]
(
	@Start_val int,
	@end int
)
as 
	begin
		--Delete ALL rows
		Truncate table tbl_number
		--Condition
		while (@Start_val <= @end)
			begin
				--Action
				--print @x
				insert into tbl_number values (@Start_val)
				--Incr/Decr
				set @Start_val =@Start_val +1

				
			end
			--Display Data
			select * from tbl_number
	end
go

--Call sp
exec usp_printNumber 5 ,10
go





