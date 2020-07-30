
select * into TblGroup_temp from TblGroup;

select  t.*,cast(t.[Year] as varchar(4))+ replicate('0', 2 - len(t.[Month])) + cast (t.[Month] as varchar) as Run_Num  
into TblGroup_bk 
from TblGroup t where [YEAR] is not null and [MONTH] is not null;

update TblGroup_bk
set GroupID=BackupGroupID;

delete from TblGroup  where [YEAR] is not null and [MONTH] is not null;

