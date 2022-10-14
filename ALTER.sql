-- Adding the coloume using ALTER
--   

use company
go

select * from product
go
--Find Scema 
sp_help product
go

--Add coloume of the table
alter table product
add Rating tinyint

--update the Data
update product
set Rating =1
where PID > 2

update product
set Rating =2
where PID =2

--drop a col from the table
alter table product
drop column UnitPrice

alter table product 
drop column Rating

alter table product
drop column Qty --Throw the error  
--drop using constraint using sp_help
--drop constraint using follwing step
alter table product
drop constraint DF__product__Qty__34C8D9D1
go
