use INDIAN_BANK
go

create table Emp
(
	eid int,
	Name varchar(100)
)
go
 
create proc  Usp_Ins_Emp_Values
(
	@eid int,
	@empName varchar(100)
)
as
begin
insert into emp values(@eid , @empName)
end
go

--call
exec Usp_Ins_Emp_Values 1 , 'Vishnu'
exec Usp_Ins_Emp_Values 2 , 'RAj'
exec Usp_Ins_Emp_Values 3 , 'Akshay'
exec Usp_Ins_Emp_Values 4 , 'Amey'
exec Usp_Ins_Emp_Values 5 , 'Swati'
go


select * from Emp
go

--UPdate valuses using SP
create proc Usp_Upadate_Emp_Values
(
	@eid int,
	@NewName varchar(100)
)
as
begin
	Update  Emp
	set Name = @NewName
	where eid = @eid
end

--call the sp
exec Usp_Upadate_Emp_Values 2,'Raj'
go

--Delete The DAta
create proc Us_Delete_Emp_Values
(
	@eid int
	
)
as
begin
		delete from Emp
		where eid = @eid
end
go

--Call The Sp
exec Us_Delete_Emp_Values 5

--See the Table
select * from Emp
go


-----------------------------------------------------------------------
--using Sp
create proc	usp_Ins_customers
(
	@CusrName	char(40),
	@Email		varchar(100),
	@phoneNO		char(20)
)
as
begin 
	insert into Customer Values(dho.seatNO(),@CusrName,@Email,phoneNO)
end
go
--SP is allow insert THe data

--Using Function
create function	fun_Ins_customers
(
	@CusrName	char(40),
	@Email		varchar(100),
	@phoneNO		char(20)
)
as
begin 
	insert into Customer Values(dho.seatNO(),@CusrName,@Email,phoneNO)
end
go

--Thowing Error
--Function is not allowed insert tha Data

-----------------------------------------------------------------------
--view do not support to Paramiterlized view 
--create function --this function is called as paramiterlized view





