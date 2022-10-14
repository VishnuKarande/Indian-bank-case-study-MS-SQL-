--Remove Duplicate Rows using CTE
Create Table Emp
(
name varchar(100)
)
go

insert Into Emp values ('Ram')
insert Into Emp values ('Ram')
insert Into Emp values ('Ravi')
insert Into Emp values ('Ravi')
insert Into Emp values ('Ravi')
insert Into Emp values ('John')
insert Into Emp values ('anu')
insert Into Emp values ('vishnu')
go

 select * from Emp
 go

--find out Dublicstes
select name, COUNT(*) as cnt 
from Emp
group by name
having COUNT(*) > 1
go  

--using distints  (Tempary delete)
select distinct name
from Emp

--but we want to paramantly delete duplicates
--using CTE
;with k 
as 
(
	select name,
	ROW_NUMBER() over (partition by Name order by name asc) as Rno
	from emp
)
delete 
from k 
where Rno > 1
go


