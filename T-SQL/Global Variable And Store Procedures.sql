--Add RS 500 existing value
declare @x MONEY
Set @x =100
Set @x=@x+500
print @x
select @x as Total

--Swapping Two values
declare @x int = 20
declare @y int = 30

print 'Before Swapping'
print @x
print @y

declare @z int

set @z=@y
set @y=@x
set @x=@z

set @z=NUll
print 'After Swapping'
print @x 
print @y
print @z
go
-------------------------------------------------------------
