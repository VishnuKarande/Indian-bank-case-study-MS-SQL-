declare @x int
set @x=10

declare @y int
set @y=20

declare @z int
set @z=@x + @y

print @z

--2nd way
declare @x int 
declare @y int
declare @z int

set @x=30
set @y=30
set @z=@x + @y
print @z

--With Sql
declare @x int 
declare @y int
declare @z int

set @x=30
set @y=30
--set @z=@x + @y
select @x +@y as Total 

--Display Result/ massages
--Both are Use select / print
declare @x int 
declare @y int
declare @z int

set @x=30
set @y=30
--set @z=@x + @y
print @x + @y
select @x +@y as Total 

--str + str using Concat
declare @x int 
declare @y int
declare @z int

set @x=30
set @y=30
--set @z=@x + @y
print 'Toatal Value :-'+Cast(@x + @y as Varchar) 
select @x +@y as Total 


   