--Gets all my sp
select * from sys.procedures

--1) Version check
select @@version
print @@version

--@@ServerName
select @@ServerName
print @@ServerName

--Error
select top 2 * from AccountMaster
go
select @@Error
Go

--Remove or add one word thowing Error
select top 2 * from AcuntMaster
go
select @@Error
Go

--Row Numner
select * from AccountMaster 
go
select @@Rowcount
go

select * from AccountMaster where ACID=101
go
select @@Rowcount

select * from AccountMaster where BRID='BR4'
go
select @@Rowcount
go

--update is also allowe





