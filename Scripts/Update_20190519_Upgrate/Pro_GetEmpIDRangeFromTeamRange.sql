USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_GetEmpIDRangeFromTeamRange]    Script Date: 05/18/2019 14:54:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Pro_GetEmpIDRangeFromTeamRange](
@TeamRange varchar(2000),
@ExcepEmpIDRange varchar(2000)
)
as

EXEC('SELECT EmployeeID,TeamID FROM TBLEMPLOYEE  
WHERE TEAMID IN('+ @TeamRange +') 
and EmployeeID NOT IN('+@ExcepEmpIDRange +')' 
)

