USE [dbHelios]
GO

/****** Object:  View [dbo].[Vew_ControlDailyData_UR]    Script Date: 05/25/2019 11:45:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO







ALTER   VIEW [dbo].[Vew_ControlDailyData_UR] AS 
SELECT     CardNo
		 , NativeName
		 , ForeignName		 
		 
		 , case  when T1>='18:16' and SUBSTRING(T1,4,2)>='16' and SUBSTRING(T1,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T1,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T1,4,2) AS int) - 15 as varchar)
				 when T1>='18:16' and SUBSTRING(T1,4,2)>='31' and SUBSTRING(T1,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T1,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T1,4,2) AS int) - 30 as varchar)  
				 when T1>='18:16' and SUBSTRING(T1,4,2)>='41' and SUBSTRING(T1,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T1,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T1,4,2) AS int) - 40 as varchar)  
				 when T1>='18:16' and SUBSTRING(T1,4,2)>='51' and SUBSTRING(T1,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T1,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T1,4,2) AS int) - 50 as varchar)				  				 
				 when T1>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T1,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T1,4,2) AS int) - 0 as varchar)
				 else T1 
		   end T1
		  ,case  when T2>='18:16' and SUBSTRING(T2,4,2)>='16' and SUBSTRING(T2,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T2,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T2,4,2) AS int) - 15 as varchar)
				 when T2>='18:16' and SUBSTRING(T2,4,2)>='31' and SUBSTRING(T2,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T2,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T2,4,2) AS int) - 30 as varchar)  
				 when T2>='18:16' and SUBSTRING(T2,4,2)>='41' and SUBSTRING(T2,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T2,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T2,4,2) AS int) - 40 as varchar)  
				 when T2>='18:16' and SUBSTRING(T2,4,2)>='51' and SUBSTRING(T2,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T2,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T2,4,2) AS int) - 50 as varchar)				  				 
				 when T2>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T2,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T2,4,2) AS int) - 0 as varchar)
				 else T2 
		   end T2
		 ,case  when T3>='18:16' and SUBSTRING(T3,4,2)>='16' and SUBSTRING(T3,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T3,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T3,4,2) AS int) - 15 as varchar)
				 when T3>='18:16' and SUBSTRING(T3,4,2)>='31' and SUBSTRING(T3,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T3,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T3,4,2) AS int) - 30 as varchar)  
				 when T3>='18:16' and SUBSTRING(T3,4,2)>='41' and SUBSTRING(T3,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T3,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T3,4,2) AS int) - 40 as varchar)  
				 when T3>='18:16' and SUBSTRING(T3,4,2)>='51' and SUBSTRING(T3,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T3,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T3,4,2) AS int) - 50 as varchar)				  				 
				 when T3>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T3,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T3,4,2) AS int) - 0 as varchar)
				 else T3 
		   end T3
		 ,case  when T4>='18:16' and SUBSTRING(T4,4,2)>='16' and SUBSTRING(T4,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T4,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T4,4,2) AS int) - 15 as varchar)
				 when T4>='18:16' and SUBSTRING(T4,4,2)>='31' and SUBSTRING(T4,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T4,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T4,4,2) AS int) - 30 as varchar)  
				 when T4>='18:16' and SUBSTRING(T4,4,2)>='41' and SUBSTRING(T4,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T4,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T4,4,2) AS int) - 40 as varchar)  
				 when T4>='18:16' and SUBSTRING(T4,4,2)>='51' and SUBSTRING(T4,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T4,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T4,4,2) AS int) - 50 as varchar)				  
				 when T4>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T4,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T4,4,2) AS int) - 0 as varchar)
				 else T4 
		   end T4
		 ,case  when T5>='18:16' and SUBSTRING(T5,4,2)>='16' and SUBSTRING(T5,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T5,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T5,4,2) AS int) - 15 as varchar)
				 when T5>='18:16' and SUBSTRING(T5,4,2)>='31' and SUBSTRING(T5,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T5,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T5,4,2) AS int) - 30 as varchar)  
				 when T5>='18:16' and SUBSTRING(T5,4,2)>='41' and SUBSTRING(T5,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T5,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T5,4,2) AS int) - 40 as varchar)  
				 when T5>='18:16' and SUBSTRING(T5,4,2)>='51' and SUBSTRING(T5,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T5,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T5,4,2) AS int) - 50 as varchar)				  				 
				 when T5>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T5,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T5,4,2) AS int) - 0 as varchar)
				 else T5 
		   end T5
		,case  when T6>='18:16' and SUBSTRING(T6,4,2)>='16' and SUBSTRING(T6,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T6,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T6,4,2) AS int) - 15 as varchar)
				 when T6>='18:16' and SUBSTRING(T6,4,2)>='31' and SUBSTRING(T6,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T6,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T6,4,2) AS int) - 30 as varchar)  
				 when T6>='18:16' and SUBSTRING(T6,4,2)>='41' and SUBSTRING(T6,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T6,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T6,4,2) AS int) - 40 as varchar)  
				 when T6>='18:16' and SUBSTRING(T6,4,2)>='51' and SUBSTRING(T6,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T6,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T6,4,2) AS int) - 50 as varchar)				  				 
				 when T6>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T6,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T6,4,2) AS int) - 0 as varchar)
				 else T6 
		   end T6
		 ,case  when T7>='18:16' and SUBSTRING(T7,4,2)>='16' and SUBSTRING(T7,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T7,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T7,4,2) AS int) - 15 as varchar)
				 when T7>='18:16' and SUBSTRING(T7,4,2)>='31' and SUBSTRING(T7,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T7,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T7,4,2) AS int) - 30 as varchar)  
				 when T7>='18:16' and SUBSTRING(T7,4,2)>='41' and SUBSTRING(T7,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T7,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T7,4,2) AS int) - 40 as varchar)  
				 when T7>='18:16' and SUBSTRING(T7,4,2)>='51' and SUBSTRING(T7,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T7,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T7,4,2) AS int) - 50 as varchar)				  				 
				 when T7>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T7,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T7,4,2) AS int) - 0 as varchar)
				 else T7 
		   end T7
		 ,case  when T8>='18:16' and SUBSTRING(T8,4,2)>='16' and SUBSTRING(T8,4,2)<='30'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T8,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T8,4,2) AS int) - 15 as varchar)
				 when T8>='18:16' and SUBSTRING(T8,4,2)>='31' and SUBSTRING(T8,4,2)<='40'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T8,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T8,4,2) AS int) - 30 as varchar)  
				 when T8>='18:16' and SUBSTRING(T8,4,2)>='41' and SUBSTRING(T8,4,2)<='50'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T8,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T8,4,2) AS int) - 40 as varchar)  
				 when T8>='18:16' and SUBSTRING(T8,4,2)>='51' and SUBSTRING(T8,4,2)<='59'  then SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T8,4,2) AS int) - 15)) + cast (cast(SUBSTRING(T8,4,2) AS int) - 50 as varchar)				  				 
				 when T8>='18:16' then  SUBSTRING(OT1Stop,1,2)  +':' + replicate('0', 2 - len(cast(SUBSTRING(T8,4,2) AS int) - 0)) + cast (cast(SUBSTRING(T8,4,2) AS int) - 0 as varchar)
				 else T8 
		   end T8
		 , F_I
		 , F_O
		 , S_I
		 , S_O
		 , CASE A WHEN 0 THEN NULL ELSE A END A
		 , CASE AW WHEN 0 THEN NULL ELSE AW END AW
		 , CASE SICK WHEN 0 THEN NULL ELSE SICK END Sick
		 , CASE prg WHEN 0 THEN NULL  ELSE prg END prg
         , CASE anl WHEN 0 THEN NULL ELSE anl END anl
         , CASE GH WHEN 0 THEN NULL ELSE GH END GH
         , CASE Mob WHEN 0 THEN NULL ELSE Mob END Mob
         , CASE Fam WHEN 0 THEN NULL ELSE Fam END Fam
         , CASE OT1 WHEN 0 THEN NULL ELSE OT1 END OT1
         , CASE OT2 WHEN 0 THEN NULL ELSE OT2 END OT2
         , CASE OT3 WHEN 0 THEN NULL ELSE OT3 END OT3
         , CASE SatHrs WHEN 0 THEN NULL ELSE SatHrs END SatHrs
         , CASE scl WHEN 0 THEN NULL ELSE scl END SCL
         , Prm
         , Status
         , TeamID
         , DrdTeamID
         , NumberOfTimer
         , SystemDate
         , TeamNameEng
         , TeamNameKH
         , Chk
         , EmpID
         , DateJoined
         , TimeRemain
         , Validate
         , case AMin when 0 then NULL else AMin end AMin
FROM         dbo.Vew_DailyWork_UR
where RecStatus ='A'







GO


