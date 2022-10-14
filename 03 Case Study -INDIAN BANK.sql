--	Create Database
create database INDIAN_BANK
go

--Change DB context
use INDIAN_BANK
go

--ProductMaster
create table ProductMaster
(
	PID				CHAR(2)			Primary Key,
	ProductName		VARCHAR(25)		not null 
)
go

--  read the table
select * from ProductMaster
go

--insert values  into table
insert into ProductMaster values('SB','Savings Bank')
insert into ProductMaster values('LA','Laon Account')
insert into ProductMaster values('FD','Fixrd Deposit')
insert into ProductMaster values('RD','Recurring Deposit')
go

--RegionMaster
create table RegionMaster
(
	RID				INTEGER			Primary Key,
	RegionName		CHAR(6)			NOT NULL
)
go

--read the table
select * from RegionMaster
go

--insert the values
insert into RegionMaster values(1,'south')
insert into RegionMaster values(2,'North ')
insert into RegionMaster values(3,'East')
insert into RegionMaster values(4,'west')
go

--BranchMaster
create table BranchMaster
(
	BRID			CHAR(3)			Primary Key,
	BranchName		VARCHAR(30)		NOT NULL,
	BranchAddress	VARCHAR(50)		NOT NULL,
	RID				INT				NOT NULL Foreign Key references RegionMaster(RID)
)
go

--Read The data
select * from BranchMaster
go
 

--insert the data
insert into BranchMaster values('BR1','Goa','opp:KLM mall panaji,Goa-672627',2)
insert into BranchMaster values('BR2','pune','Near Sarasbhag,pune-4100143',4)
insert into BranchMaster values('BR3','Narhe','Near Jspm College,pune',3)
insert into BranchMaster values('BR4','HYD','opp:7 mall HYD-627257',1)
go
insert into BranchMaster values('BR5','Delhi','Delhi collz of Engg.',2)
insert into BranchMaster values('BR6','pune','Ambegoan pathar, Pune-410828',4)
insert into BranchMaster values('BR7','Mumbai','Kataraj Chowck,puen-416152',3)
insert into BranchMaster values('BR8','Bengaloro','opp:Hayteke city,Beng-2348756',4)
go
--update the value
update BranchMaster
set BRID='BR1'
where BranchName='Goa'
go

--UserMaster
create table UserMaster
(
	UserID			Int				Primary Key,
	UserName		VARCHAR(30)		NOT NULL,
	Designation		CHAR(1)			NOT NULL check(Designation in ('M','T','C','O')) 
)	
go

--Read The data
select * from UserMaster
go

--insert the Data
insert into UserMaster values(1,'Vishnu','M')
insert into UserMaster values(2,'Raj','T')
insert into UserMaster values(3,'Nilesh','O')
insert into UserMaster values(4,'Priyanko','O')
insert into UserMaster values(5,'Umesh','T')
insert into UserMaster values(6,'Sandesh','M')
insert into UserMaster values(7,'Anil','C')
insert into UserMaster values(8,'Akshay','C')
insert into UserMaster values(9,'Iswar','M')
insert into UserMaster values(10,'Bhaskar','T')
insert into UserMaster values(11,'Join k','C')
 go

 --AccountMaster

 create table AccountMaster
 (
	ACID				Int					Primary Key,
	NAME				VARCHAR(40)			NOT NULL, 
	ADDRESS				VARCHAR(50)			NOT NULL,
	BRID				CHAR(3)				NOT NULL Foreign Key references BranchMaster(BRID),
	PID					CHAR(2)				NOT NULL Foreign Key references ProductMaster(PID),
	DOO					DATETIME			NOT NULL,
	CBalance			MONEY				NULL, 
	UBalance			MONEY				NULL, 
	Status				CHAR(1)				NOT NULL Check(Status in ('O','I','C'))
 )
 go


 --read The Data
 Select * from AccountMaster
 go

 --insert into values
 insert into AccountMaster values(101,'Vishnu','USA','BR1','SB','2018/10/3',1000,1000,'O')
 insert into AccountMaster values(102,'Akshay lagad','Aahagamad nagar','BR8','SB','2018/2/2',2000,2000,'O')
 insert into AccountMaster values(103,'Iswer','A/p pune,TAl-Haweli,Dict-pune','BR2','FD','2019/9/3',5000,5000,'O')
 insert into AccountMaster values(104,'Ajay','A/p mumbai','BR6','SB','2020/10/3',7000,4000,'I')
 go
 insert into AccountMaster values(105,'Namrta','USA','BR1','SB','2018/1/3',1000,1000,'C')
 insert into AccountMaster values(106,'subhadha','MUmbai','BR5','FD','2019/2/2',2000,3000,'I')
 insert into AccountMaster values(107,'Uttakatsh','pune','BR6','RD','2019/3/2',7000,9000,'O')
 insert into AccountMaster values(108,'Nilesh','Dubai','BR4','LA','2020/1/3',9000,5000,'I')
 go

 --upadate the data
 update AccountMaster
 set Status='O'
 where ACID=107
go

--TransactionMaster
create table TransactionMaster
(
	TranNO 			Int				Primary Key Identity(1,1),
	DOTran			datetime		NOT NULL,
	ACID			INTEGER			NOT NULL Foreign Key references AccountMaster(ACID), 		
	BRID			CHAR(3)			NOT NULL Foreign Key references BranchMaster(BRID),
	TXN_TYPE		CHAR(3)			NOT NULL check(TXN_TYPE in ('CW','CD','CQD')),	  
	--‘CW’ for ‘CASH WITHDRAWAL’, ‘CD’ for ‘CASH DEPOSIT’, ‘CQD’ for ‘CHEQUE DEPOSIT’
	CHQ_NO			INTEGER			NULL,
	CHQ_DATE		SMALLDATETIME	NULL, 
	TXN_AMOUNT		MONEY			NOT NULL,
	UserID			INTEGER			NOT NULL Foreign Key references UserMaster(UserID)	
)
go 

--Truncate/indentity
Truncate table TransactionMaster
go

--see the table
select * from TransactionMaster
go

--insert the values
insert into TransactionMaster values('2019/1/12',103,'BR4','CD',null,null,1000,2)
insert into TransactionMaster values('2019/2/2',104,'BR4','CD',null,null,5000,3)
insert into TransactionMaster values('2019/3/4',105,'BR6','CW',null,null,4000,10)
insert into TransactionMaster values('2019/2/10',104,'BR4','CQD',1234,'2019/2/7',800,10)
insert into TransactionMaster values('2019/2/10',108,'BR4','CQD',5678,'2019/2/7',8800,10)
insert into TransactionMaster values('2019/3/5',106,'BR7','CD',null,null,10100,7)




