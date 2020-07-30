USE [dbNasmi]
GO

/****** Object:  View [dbo].[Vew_ControlDailyData]    Script Date: 05/04/2019 13:05:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO





ALTER   VIEW [dbo].[Vew_ControlDailyData] AS 
SELECT     CardNo
		 , NativeName
		 , ForeignName
		 , T1
		 , T2
		 , T3
		 , T4
		 , T5
		 , T6
		 , T7
		 , T8
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
FROM         dbo.Vew_DailyWork
where RecStatus ='A'




GO


