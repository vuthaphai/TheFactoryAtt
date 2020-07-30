
select * into TblShift_temp from TblShift;

select  t.*,cast(t.[Year] as varchar(4))+ replicate('0', 2 - len(t.[Month])) + cast (t.[Month] as varchar) as Run_Num  
into TblShift_bk 
from TblShift t where [YEAR] is not null and [MONTH] is not null;

update TblShift_bk
set ShiftID=BackupShiftID;

delete from TblShift  where [YEAR] is not null and [MONTH] is not null;

