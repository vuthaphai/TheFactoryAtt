USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_Team_Update]    Script Date: 05/18/2019 15:17:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dbo].[Pro_Team_Update](
@TeamID bigint,
@NameKh nvarchar(150),
@NameEng nvarchar(150),
@ShiftID bigint,
@Description nvarchar(800)
--@ChkMinistry bit

)AS 
UPDATE TblTeam SET 

TeamNameKh=@NameKh,
TeamNameEng=@NameEng,
ShiftID=@ShiftID,
[Description]=@Description
--CheckedMinistry=@ChkMinistry
WHERE TeamID=@TeamID
