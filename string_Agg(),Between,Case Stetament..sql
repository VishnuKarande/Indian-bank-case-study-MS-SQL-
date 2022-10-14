use INDIAN_BANK
go

IF Exists (select * from sys.tables where name='Employee')
	Drop Table Employee
go
--crete table
create table Employee
(
EID			int				not null,
empName		Varchar(100)	not null
 )

 --insert values into table
 insert into Employee values(1,'Vishnu')
 insert into Employee values(1,'Karande')
 insert into Employee values(2,'raj')
 insert into Employee values(2,'Hode')
 insert into Employee values(3,'Ankita')
 go

 --see the table
 select * from Employee
 go
 

----------------------------using string_Agg()--------------------------------
select EID,string_agg (empName,'  ') as EmpName 
from Employee
group by EID
go


---------------------------------Between------------------------------
--Que--List of cust whose balance Between 1000 and 5000
select *
from AccountMaster
where CBalance between 1000 and 5000
go

--Que--whose opaned account between 2018 and 2021
select	Name, datepart(yy,DOO) as Opende_account
from AccountMaster
where DATEPART(yy,DOO) between 2018 and 2021
group by NAME,datepart(yy,DOO)
go

------------------------------------Case statement---------------------------------
select	
		ACID,
		NAME,
		CBalance,
		Case
			When CBalance <1000					Then 'Silver'
			when CBalance between 1000 and 5000		Then 'Gold'
			else 'Diamond'
		END as CustType
from AccountMaster
go

-----------------subquery(or)Nasted Query(or)Inner Query-----------------------------
--Que-Who has highest balance in bank

select Name,Cbalance
from AccountMaster
group by name,Cbalance     --All Data
order by CBalance desc
go

--Secoun WAY
select max(CBalance)   --9000.00
from AccountMaster
go

--above this two code are invalid
--I want only NAME
select name
from AccountMaster										--Nilesh
where Cbalance =(select MAX(Cbalance)from AccountMaster)
go