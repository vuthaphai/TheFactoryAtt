USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Team_Add]    Script Date: 07/25/2020 11:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER    PROCEDURE [dbo].[Pro_Team_Add](
@Year char(4),
@Month tinyint,
@NameKh nvarchar(150),
@NameEng nvarchar(150),
@ShiftID bigint,
@Description nvarchar(800),
@BackupTeamID bigint,
--@ChkMinistry bit,
@getNewTeamID bigint OUTPUT

)AS 

exec @getNewTeamID=dbo.funGenerateNewID;
IF not(@Year is null) 
begin
	select @ShiftID=ShiftID from TblShift WHERE BackupShiftID=@ShiftID
end

INSERT INTO 
TblTeam 
(
[Year],
[Month],
TeamID,
TeamNameKh,
TeamNameEng,
ShiftID,
[Description],
BackupTeamID
--CheckedMinistry
)
VALUES(
@Year,
@Month,
@getNewTeamID,
@NameKh,
@NameEng,
@ShiftID,
@Description,
@BackupTeamID
)
--SET @getNewTeamID=@@identity


