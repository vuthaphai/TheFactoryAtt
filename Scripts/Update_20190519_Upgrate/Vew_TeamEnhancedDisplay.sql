USE [dbNasmi]
GO

/****** Object:  View [dbo].[Vew_TeamEnhancedDisplay]    Script Date: 05/04/2019 15:02:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER  VIEW [dbo].[Vew_TeamEnhancedDisplay]
AS
SELECT     TeamID, TeamNameKH + ' (' +  TeamNameEng + ')' AS TeamName, [Year], [Month], BackupTeamID
FROM         dbo.TblTeam


GO


