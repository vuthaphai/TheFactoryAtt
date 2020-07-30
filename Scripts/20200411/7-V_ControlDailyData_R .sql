USE dbYingYi02
GO

/****** Object:  View [dbo].[Vew_EmployeeInfo]    Script Date: 10/05/2019 15:26:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO





create   VIEW [dbo].[V_ControlDailyData_R] AS 
select  empId
		,systemDate
		,Cardno	
		,NativeName
		,workingHours
		,wdtype
		,leaveHours
		,leavetype
		,a
		,aw
		,GH
		,mob
		,prg
		,sick
		,anl
		,fam
		,chk
		,TeamNameEng
		,TeamID
		,t1
		,t2
		,t3
		,t4
		,t5
		,t6
		,t7
		,t8
		,OT1
		,OT2
		,OT3
		, Status
		,'' AS Description
from twrk_control_daily_data





GO


