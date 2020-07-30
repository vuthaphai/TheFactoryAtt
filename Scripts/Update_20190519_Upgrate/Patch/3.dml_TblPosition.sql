
select * into TblPosition_temp from TblPosition;

select  t.*,cast(t.[Year] as varchar(4))+ replicate('0', 2 - len(t.[Month])) + cast (t.[Month] as varchar) as Run_Num  
into TblPosition_bk 
from TblPosition t where [YEAR] is not null and [MONTH] is not null;

update TblPosition_bk
set PositionID=BackupPosID;

delete from TblPosition  where [YEAR] is not null and [MONTH] is not null;

