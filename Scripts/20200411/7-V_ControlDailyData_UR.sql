USE dbYingYi02
GO

/****** Object:  View [dbo].[Vew_EmployeeInfo]    Script Date: 10/05/2019 15:26:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


create   VIEW [dbo].[V_ControlDailyData_UR] AS 
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
		,case  when T1>='18:16' and SUBSTRING(T1,4,2)>='16' and SUBSTRING(T1,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T1,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T1,4,2) AS int) - 15 as varchar)
				 when T1>='18:16' and SUBSTRING(T1,4,2)>='31' and SUBSTRING(T1,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T1,4,2) AS int) - 30)) + cast (cast(SUBSTRING(T1,4,2) AS int) - 30 as varchar)  
				 when T1>='18:16' and SUBSTRING(T1,4,2)>='41' and SUBSTRING(T1,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T1,4,2) AS int) - 40)) + cast (cast(SUBSTRING(T1,4,2) AS int) - 40 as varchar)  
				 when T1>='18:16' and SUBSTRING(T1,4,2)>='51' and SUBSTRING(T1,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T1,4,2) AS int) - 50)) + cast (cast(SUBSTRING(T1,4,2) AS int) - 50 as varchar)				  				 
				 when T1>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T1,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T1,4,2) AS int) - 0 as varchar)
				 else T1 
		   end T1
		  ,case  when T2>='18:16' and SUBSTRING(T2,4,2)>='16' and SUBSTRING(T2,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T2,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T2,4,2) AS int) - 15 as varchar)
				 when T2>='18:16' and SUBSTRING(T2,4,2)>='31' and SUBSTRING(T2,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T2,4,2) AS int) - 30)) + cast (cast(SUBSTRING(T2,4,2) AS int) - 30 as varchar)  
				 when T2>='18:16' and SUBSTRING(T2,4,2)>='41' and SUBSTRING(T2,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T2,4,2) AS int) - 40)) + cast (cast(SUBSTRING(T2,4,2) AS int) - 40 as varchar)  
				 when T2>='18:16' and SUBSTRING(T2,4,2)>='51' and SUBSTRING(T2,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T2,4,2) AS int) - 50)) + cast (cast(SUBSTRING(T2,4,2) AS int) - 50 as varchar)				  				 
				 when T2>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T2,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T2,4,2) AS int) - 0 as varchar)
				 else T2 
		   end T2
		 ,case  when T3>='18:16' and SUBSTRING(T3,4,2)>='16' and SUBSTRING(T3,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T3,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T3,4,2) AS int) - 15 as varchar)
				 when T3>='18:16' and SUBSTRING(T3,4,2)>='31' and SUBSTRING(T3,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T3,4,2) AS int) - 30)) + cast (cast(SUBSTRING(T3,4,2) AS int) - 30 as varchar)  
				 when T3>='18:16' and SUBSTRING(T3,4,2)>='41' and SUBSTRING(T3,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T3,4,2) AS int) - 40)) + cast (cast(SUBSTRING(T3,4,2) AS int) - 40 as varchar)  
				 when T3>='18:16' and SUBSTRING(T3,4,2)>='51' and SUBSTRING(T3,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T3,4,2) AS int) - 50)) + cast (cast(SUBSTRING(T3,4,2) AS int) - 50 as varchar)				  				 
				 when T3>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T3,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T3,4,2) AS int) - 0 as varchar)
				 else T3 
		   end T3
		 ,case  when T4>='18:16' and SUBSTRING(T4,4,2)>='16' and SUBSTRING(T4,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T4,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T4,4,2) AS int) - 15 as varchar)
				 when T4>='18:16' and SUBSTRING(T4,4,2)>='31' and SUBSTRING(T4,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T4,4,2) AS int) - 30)) + cast (cast(SUBSTRING(T4,4,2) AS int) - 30 as varchar)  
				 when T4>='18:16' and SUBSTRING(T4,4,2)>='41' and SUBSTRING(T4,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T4,4,2) AS int) - 40)) + cast (cast(SUBSTRING(T4,4,2) AS int) - 40 as varchar)  
				 when T4>='18:16' and SUBSTRING(T4,4,2)>='51' and SUBSTRING(T4,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T4,4,2) AS int) - 50)) + cast (cast(SUBSTRING(T4,4,2) AS int) - 50 as varchar)				  
				 when T4>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T4,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T4,4,2) AS int) - 0 as varchar)
				 else T4 
		   end T4
		 ,case  when T5>='18:16' and SUBSTRING(T5,4,2)>='16' and SUBSTRING(T5,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T5,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T5,4,2) AS int) - 15 as varchar)
				 when T5>='18:16' and SUBSTRING(T5,4,2)>='31' and SUBSTRING(T5,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T5,4,2) AS int) - 30)) + cast (cast(SUBSTRING(T5,4,2) AS int) - 30 as varchar)  
				 when T5>='18:16' and SUBSTRING(T5,4,2)>='41' and SUBSTRING(T5,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T5,4,2) AS int) - 40)) + cast (cast(SUBSTRING(T5,4,2) AS int) - 40 as varchar)  
				 when T5>='18:16' and SUBSTRING(T5,4,2)>='51' and SUBSTRING(T5,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T5,4,2) AS int) - 50)) + cast (cast(SUBSTRING(T5,4,2) AS int) - 50 as varchar)				  				 
				 when T5>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T5,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T5,4,2) AS int) - 0 as varchar)
				 else T5 
		   end T5
		,case  when T6>='18:16' and SUBSTRING(T6,4,2)>='16' and SUBSTRING(T6,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T6,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T6,4,2) AS int) - 15 as varchar)
				 when T6>='18:16' and SUBSTRING(T6,4,2)>='31' and SUBSTRING(T6,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T6,4,2) AS int) - 30)) + cast (cast(SUBSTRING(T6,4,2) AS int) - 30 as varchar)  
				 when T6>='18:16' and SUBSTRING(T6,4,2)>='41' and SUBSTRING(T6,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T6,4,2) AS int) - 40)) + cast (cast(SUBSTRING(T6,4,2) AS int) - 40 as varchar)  
				 when T6>='18:16' and SUBSTRING(T6,4,2)>='51' and SUBSTRING(T6,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T6,4,2) AS int) - 50)) + cast (cast(SUBSTRING(T6,4,2) AS int) - 50 as varchar)				  				 
				 when T6>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T6,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T6,4,2) AS int) - 0 as varchar)
				 else T6 
		   end T6
		 ,case  when T7>='18:16' and SUBSTRING(T7,4,2)>='16' and SUBSTRING(T7,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T7,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T7,4,2) AS int) - 15 as varchar)
				 when T7>='18:16' and SUBSTRING(T7,4,2)>='31' and SUBSTRING(T7,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T7,4,2) AS int) - 30)) + cast (cast(SUBSTRING(T7,4,2) AS int) - 30 as varchar)  
				 when T7>='18:16' and SUBSTRING(T7,4,2)>='41' and SUBSTRING(T7,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T7,4,2) AS int) - 40)) + cast (cast(SUBSTRING(T7,4,2) AS int) - 40 as varchar)  
				 when T7>='18:16' and SUBSTRING(T7,4,2)>='51' and SUBSTRING(T7,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T7,4,2) AS int) - 50)) + cast (cast(SUBSTRING(T7,4,2) AS int) - 50 as varchar)				  				 
				 when T7>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T7,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T7,4,2) AS int) - 0 as varchar)
				 else T7 
		   end T7
		 ,case  when T8>='18:16' and SUBSTRING(T8,4,2)>='16' and SUBSTRING(T8,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T8,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T8,4,2) AS int) - 15 as varchar)
				 when T8>='18:16' and SUBSTRING(T8,4,2)>='31' and SUBSTRING(T8,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T8,4,2) AS int) - 30)) + cast (cast(SUBSTRING(T8,4,2) AS int) - 30 as varchar)  
				 when T8>='18:16' and SUBSTRING(T8,4,2)>='41' and SUBSTRING(T8,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T8,4,2) AS int) - 40)) + cast (cast(SUBSTRING(T8,4,2) AS int) - 40 as varchar)  
				 when T8>='18:16' and SUBSTRING(T8,4,2)>='51' and SUBSTRING(T8,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T8,4,2) AS int) - 50)) + cast (cast(SUBSTRING(T8,4,2) AS int) - 50 as varchar)				  				 
				 when T8>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T8,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T8,4,2) AS int) - 0 as varchar)
				 else T8 
		   end T8
		,OT1
		,OT2
		,OT3
		, Status
		,'' AS Description
from twrk_control_daily_data





GO


