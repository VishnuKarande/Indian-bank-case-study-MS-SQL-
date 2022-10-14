use INDIAN_BANK
go

--Create tables
Create table ITEM
(
		ItemName		varchar(50)		not null,
		Color			varchar(50)		not null,
		Qty				int				not null
)
go
--drop table
drop table ITEM
go

--insert Values
insert into ITEM values('Chair','Black',10)
insert into ITEM values('Chair','RED',15)
insert into ITEM values('Table','Black',20)
insert into ITEM values('Chair','Black',30)
insert into ITEM values('Table','RED',30)
go

--see the table
select * from ITEM
go


--total
select Sum(Qty) as Total 
from item	--105
go

--Total Qnty Of chair
select Sum(Qty) as Total
from ITEm
where itemname='Chair'
go

--Total Qnty Of Tables
select Sum(Qty) as Total
from ITEm
where itemname='Table'
go

--Total Qnty for Black
select Sum(Qty) as Total
from ITEm
where color='Black'
go

--item wise ,color wise total Qty
select itemName,color,sum(Qty) as Total_Qty
from item
group by ItemName,color
go

-------------------------------Cube---------------------------------
select itemName,color,sum(Qty) as Total_Qty
from item
group by ItemName,color with Cube
go

-------------------------------Rollup---------------------------------
select itemName,color,sum(Qty) as Total_Qty
from item
group by ItemName,color with Rollup
go
