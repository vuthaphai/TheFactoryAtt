USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_GetEmpIDByTeam]    Script Date: 05/18/2019 14:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Pro_GetEmpIDByTeam]
(
@TeamID bigint
)as
SELECT EmployeeID FROM TBLEMPLOYEE WHERE
TEAMID =@TeamID
