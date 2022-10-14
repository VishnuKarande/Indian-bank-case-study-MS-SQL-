--Like oprrator
--Oue-list of Customers whoses name start with "k%" 
select *
from AccountMaster
where NAME LIKE 'v%' --1st letter --Vishnu
go

--i want to secound latter is I
select * 
from AccountMaster
where NAME like '_i%' --Vishnu,Nilesh
go

--1st latter can't be a 
-- use  not like
select *
from AccountMaster
where NAME not like 'V%'
go

--End latter is u(%u) ----Namrta,subhadha
select *
from AccountMaster
where NAME like '%a'
go 

--Name contains k ----Akshay lagad,Ajay,Namrta,subhadha,Uttakatsh
select * 
from AccountMaster
where NAME like '%a%' 
go

--Name should not contains k
--(Vishnu,Iswer,Nilesh)
select * 
from AccountMaster
where NAME not like '%a%' 
go

--name start with v and u
--((start-v, end-u)--Vishnu)
select *
from AccountMaster
where NAME like 'V%u' 
go  

--Name end with (%name)

 