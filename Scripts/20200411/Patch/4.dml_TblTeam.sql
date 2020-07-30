
select * into TblTeam_temp from TblTeam;

select  t.*,cast(t.[Year] as varchar(4))+ replicate('0', 2 - len(t.[Month])) + cast (t.[Month] as varchar) as Run_Num  
into TblTeam_bk 
from TblTeam t where [YEAR] is not null and [MONTH] is not null;

update TblTeam_bk
set TeamID=BackupTeamID;

delete from TblTeam  where [YEAR] is not null and [MONTH] is not null;

