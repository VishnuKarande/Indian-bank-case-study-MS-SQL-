use company
go

create table product
(
	PID			int				primary key identity(1,1),
	ProdName	varchar(100)	not null,
	Qty			int				null	default(0), 
	UnitPrice	money			not null
)
go

--See The Database
select * from product
go

--schema Of the Tabel
sp_help product
go

--insert Values
insert into product values('Pen',1000,10)
insert into product values('Penchil',2000,7)
insert into product values('Lux',1000,10)

insert into product values('Dove',120,61)

insert into product values('cadhabury',300,24)

--Default values(null values)
insert into product values('Liril',null,45)
insert into product values('Rin','',30)

--Explicit Insert
insert into product(ProdName,UnitPrice) values ('HP Lappy',1000)
insert into product(UnitPrice, ProdName) values (4000,'Iphone')

--Last Inserted Identity value
select @@IDENTITY
go

select * from product
go

--delete all rows
delete from product
go    

--delete all rows
delete from product where PID = 13
go

--delete all rows using Truncate command
--Delete all rows then use Tracate command
Truncate Table product
go



