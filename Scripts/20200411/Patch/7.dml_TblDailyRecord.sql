
select * into TblDailyRecord_temp from TblDailyRecord;

select  t.*, SUBSTRING (replace(convert(varchar, SystemDate,111),'/',''),1,6) as Run_Num  
into TblDailyRecord_bk 
from TblDailyRecord t ;

update TblDailyRecord_bk
set EmployeeID=BackupEmpID;

update TblDailyRecord
set EmployeeID=BackupEmpID;



