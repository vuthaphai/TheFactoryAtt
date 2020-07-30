USE dbYingYi02
GO

/****** Object:  View [dbo].[Vew_AskPermission]    Script Date: 08/18/2019 22:41:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

alter VIEW [dbo].[Vew_AskPermission] AS 
select  ap.EmpID
		 , e.TeamID
		 , e.Salary
		 , ap.TransactionDate
		 , e.EmployeeCardNo
		 , ap.[Description]
		 , e.EmployeeNameEng EmployeeNameKh
		 , e.EmployeeNameKh EmployeeNameEng
		 , e.Sex
		 , e.TeamNameEng TeamKh
		 , e.TeamNameKh TeamEng
		 , e.PositionNameEng PositionKh
		 , e.PositionNameOther PositionEng
		 , e.DateJoined
		 , ap.AskPermissionTypeID
		 , apt.AskPermissionType
         , ap.LeaveDate   
         , ap.LeaveHours       
         , ap.askID
         , u.[User Name]
FROM (TblAskPermission ap INNER JOIN 
	(select fld_valu as AskPermissionTypeID,fld_valu_descEng AskPermissionType from tfield_values where rec_status='A')apt on ap.AskPermissionTypeID=apt.AskPermissionTypeID
	 inner join tbluser u ON u.ID = ap.userID) INNER JOIN
	 Vew_EmployeeInfo e ON ap.EmpID = e.EmployeeID
GO


