
select * into TblEmployee_temp from TblEmployee;

select  e.*,cast(e.[Year] as varchar(4))+ replicate('0', 2 - len(e.[Month])) + cast (e.[Month] as varchar) as Run_Num  
into TblEmployee_bk 
from TblEmployee e where [YEAR] is not null and [MONTH] is not null;

update TblEmployee_bk
set EmployeeID=BackupEmpID;

delete from TblEmployee  where [YEAR] is not null and [MONTH] is not null;

