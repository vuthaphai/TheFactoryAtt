USE [dbNasmi]
GO

/****** Object:  View [dbo].[Vew_DailyWork]    Script Date: 05/04/2019 13:11:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[Vew_DailyWork]
AS
SELECT     EmployeeCardNo AS CardNo, EmployeeNameEng AS NativeName, EmployeeNameKh AS ForeignName, SUBSTRING(TimeScan, 1, 5) AS T1, 
						SUBSTRING(TimeScan, 7, 5) AS T2
                      , SUBSTRING(TimeScan, 13, 5) AS T3
                      , SUBSTRING(TimeScan, 19, 5) AS T4
                      , SUBSTRING(TimeScan, 25, 5) AS T5
                      , SUBSTRING(TimeScan, 31, 5) AS T6
                      , SUBSTRING(TimeScan, 37, 5) AS T7
                      , SUBSTRING(TimeScan, 43, 5) AS T8
                      , ST1 AS F_I
                      , ST2 AS F_O
                      , ST3 AS S_I
                      , ST4 AS S_O
                      , AbsenceHours AS A
                      , AbsenceWarningHours AS AW
                      , SickTimes AS Sick
                      , Pregnant AS Prg
                      , VacationDays AS Anl
                      , GoHome AS GH
                      , Mobility AS Mob
                      , FamilyProblem AS Fam
                      , OT1
                      , OT2
                      , OTS AS OT3
                      , CutAttendanceAmount AS Prm
                      , ISNULL(Status, '') AS Status
                      , TeamID
                      , NumberOfTimer
                      , SystemDate
                      , TeamNameEng
                      , TeamNameKH
                      , Checked AS Chk
                      , EmployeeID AS EmpID
                      , SatHrs
                      , SCL
                      , DateJoined
                      , TimeRemain
                      , Validate
                      , FingerprintNumber
                      , PositionNameEng
                      , PositionNameOther
                      , Salary
                      , Currency
                      , PhotoPath
                      , DrdTeamID
                      , AbsenceMin AS AMin
                      , RecStatus
FROM         dbo.Vew_ControlList
where RecStatus ='A'





GO


