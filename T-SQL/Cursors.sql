use INDIAN_BANK
go

--Cursor
declare @x int
	--@x is veriable and dtype is int
set @x = 20
print @x
go

--Cursor
declare bank_cursor cursor	FOR
select * from AccountMaster

open bank_cursor
Fetch Next From bank_cursor

While @@FETCH_STATUS=0
Fetch Next From bank_cursor

Close bank_cursor
Deallocate bank_cursor
go
 --------------------------------------------------------------
declare MYCR1 cursor for 
select * from AccountMaster

open MYCR1

--fectch ro
Fetch next  from mycr1

---------------using Scroll-----------------
declare MYCR2 cursor scroll for 
select * from AccountMaster

--opon Cursor
open MYCR2

--Fectch Last Row using scroll
Fetch last  from mycr2

--Fectch currmtly which data feel in table
Fetch prior  from mycr2

--3)Reletive	4) Absulute
Close mycr2
Deallocate mycr2
go

--HOw to indentify is cursor is open state or not
if CURSOR_STATUS('Global','bank_cursor')>=-1
begin	
		print 'The above Cursor is in Open State'
end