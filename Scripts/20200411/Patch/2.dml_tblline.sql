
select * into TblLine_temp from TblLine;

select  t.*,cast(t.[Year] as varchar(4))+ replicate('0', 2 - len(t.[Month])) + cast (t.[Month] as varchar) as Run_Num  
into TblLine_bk 
from TblLine t where [YEAR] is not null and [MONTH] is not null;

update TblLine_bk
set LINEID=BackupLineID;

delete from TblLine  where [YEAR] is not null and [MONTH] is not null;

