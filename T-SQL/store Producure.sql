use INDIAN_BANK
go

--Create a store proc
create proc Usp_AddNum
as
begin
		declare @x int
		declare @y int
		declare @z int

		set @x=10
		Set @y=20
		set @z=@x + @y
		print @z

end
go 

--I wanted to call store Prod / Call sp
exec Usp_AddNum
go

--Can i supply The data to store producure(Yes),HOw?
--using modify(Right Click)
/*
ALTER proc [dbo].[Usp_AddNum]
as
begin
		declare @x int
		declare @y int
		declare @z int

		set @x=100
		Set @y=200
		set @z=@x + @y
		print @z

end
*/

--call sp
exec Usp_AddNum


--program with input parameter
ALTER proc [dbo].[Usp_AddNum]
(
	--input Parameters
	@x int,
	@y int
)
as
begin
		declare @z int
		set @z=@x + @y
		print @z

end

--How to call it
exec Usp_AddNum 10,10

--ATM Get my Account Balance
create proc Usp_GetMyAccountBalamce
(
	@Acid int
)
as
begin
	select CBalance  
	from AccountMaster
	where acid=@Acid
end

--Excute sp
--client (ATM,Mb)
exec Usp_GetMyAccountBalamce 2
go