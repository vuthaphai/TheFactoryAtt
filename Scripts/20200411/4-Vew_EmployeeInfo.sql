USE dbYingYi02
GO

/****** Object:  View [dbo].[Vew_EmployeeInfo]    Script Date: 10/05/2019 15:26:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO





alter   VIEW [dbo].[Vew_EmployeeInfo] AS 
select  e.EmployeeID
	   ,e.EmployeeCardNo
	   ,e.EmployeeNameKh
	   ,e.EmployeeNameEng
	   ,e.DateJoined
	   ,e.DateResigned
	   ,e.Sex
	   ,e.FingerprintNumber
	   ,e.Currency
	   ,e.Salary
	   ,e.PhotoPath
	   ,e.RecStatus
	   ,t.TeamID
	   ,t.TeamNameEng
	   ,t.TeamNameKh
	   ,sh.FirstIn
	   ,sh.FirstOut
	   ,sh.SecondIn
	   ,sh.SecondOut
	   ,sh.OT1Stop
	   ,p.PositionNameEng
	   ,p.PositionNameOther
	   
from TblEmployee e
,TblTeam t
,TblPosition p
,TblShift sh
where e.TeamID=t.TeamID
and t.ShiftID=sh.ShiftID
and e.PositionID=p.PositionID





GO


