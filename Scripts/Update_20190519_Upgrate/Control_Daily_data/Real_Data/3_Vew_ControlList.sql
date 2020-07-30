USE [dbNasmi]
GO

/****** Object:  View [dbo].[Vew_ControlList]    Script Date: 05/04/2019 13:13:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[Vew_ControlList]
AS
SELECT        dbo.TblDailyRecord.EmployeeID
			, VEmpInfo.EmployeeCardNo
			, VEmpInfo.EmployeeNameEng
			, VEmpInfo.EmployeeNameKh
			, dbo.TblDailyRecord.SystemDate			
            , dbo.TblDailyRecord.NumberOfTimer
            , dbo.TblDailyRecord.TimeScan
            , dbo.TblDailyRecord.OT1
            , dbo.TblDailyRecord.OT2
            , dbo.TblDailyRecord.OTS
            , dbo.TblDailyRecord.GoHome
            , dbo.TblDailyRecord.SickTimes
            , dbo.TblDailyRecord.AbsenceHours
            , dbo.TblDailyRecord.AbsenceWarningHours
            , dbo.TblDailyRecord.VacationDays
            , dbo.TblDailyRecord.Pregnant
            , dbo.TblDailyRecord.CutAttendanceAmount
            , dbo.TblDailyRecord.Status
            , dbo.TblDailyRecord.Checked
            , dbo.TblDailyRecord.FirstIn AS ST1
            , dbo.TblDailyRecord.FirstOut AS ST2
            , dbo.TblDailyRecord.SecondIn AS ST3
            , dbo.TblDailyRecord.SecondOut AS ST4
            , VEmpInfo.FirstIn
            , VEmpInfo.FirstOut
            , VEmpInfo.SecondIn
            , VEmpInfo.SecondOut
            , VEmpInfo.OT1 AS OT1Start
            , VEmpInfo.OT2 AS OT2Start
            , VEmpInfo.OTS AS OTSStart
            , VEmpInfo.BeforeWorkingAllowed
            , VEmpInfo.AfterWorkingAllowed
            , VEmpInfo.GroupID
            , dbo.TblDailyRecord.Remark
            , dbo.TblDailyRecord.Mobility
            , dbo.TblDailyRecord.FamilyProblem
            , VEmpInfo.OT1Stop
            , VEmpInfo.OT2Stop
            , VEmpInfo.OTsStop
            , VEmpInfo.BackupTeamID
            , VEmpInfo.BackupGroupID
            , VEmpInfo.BackupEmpID
            , VEmpInfo.TeamNameKh
            , VEmpInfo.TeamNameEng
            , VEmpInfo.TeamID
            , dbo.TblDailyRecord.SatHrs
            , VEmpInfo.DateJoined
            , dbo.TblDailyRecord.SpecialLeave AS SCL
            , dbo.TblDailyRecord.TimeRemain
            , dbo.TblDailyRecord.Validate
            , VEmpInfo.FingerprintNumber
            , VEmpInfo.PositionNameEng
            , VEmpInfo.PositionNameOther
            , VEmpInfo.Salary
            , VEmpInfo.Currency
            , VEmpInfo.PhotoPath
            , VEmpInfo.Sex
            , VEmpInfo.Stop
            , dbo.TblDailyRecord.TeamID AS DrdTeamID
            , dbo.TblDailyRecord.AbsenceMin
            ,VEmpInfo.RecStatus
FROM         dbo.TblDailyRecord 
				INNER JOIN
             dbo.Vew_EmpInformation AS VEmpInfo 
				ON 
             dbo.TblDailyRecord.EmployeeID = VEmpInfo.EmployeeID
where VEmpInfo.RecStatus ='A'



GO


