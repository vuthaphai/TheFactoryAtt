USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_DailyRecord_Update]    Script Date: 10/05/2019 13:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO







ALTER     procedure [dbo].[Pro_DailyRecord_Update]
(
@Date datetime,
@EmpID BigINT,
@T1 varchar(5),
@T2 varchar(5),
@T3 varchar(5),
@T4 varchar(5),
@T5 varchar(5),
@T6 varchar(5),
@T7 varchar(5),
@T8 varchar(5),
--@FI VARCHAR(5),
--@FO VARCHAR(5),
--@SI VARCHAR(5),
--@SO VARCHAR(5),
@WorkingHours Float,
@OT1 Float,
@OT2 Float,
@OT3 Float,
@A INT,
@AW INT,
--@AMin INT,
@Sick int,
@ANL int,
@GH INT,
@PRG INT,
@MOB INT,
@FAM INT,
--@SatHrs int,
--@SCL int,
--@Prm bit,
@Chk bit
)
as
declare @TimeScan varchar(4000)

if not(@T1 is null OR @T1='')
set @TimeScan= @T1+','
if not(@T2 is null OR @T2='')
set @TimeScan=@TimeScan+@T2+','
if not(@T3 is null OR @T3='')
set @TimeScan=@TimeScan+@T3+','
if not(@T4 is null OR @T4='')
set @TimeScan=@TimeScan+@T4+','
if not(@T5 is null OR @T5='')
set @TimeScan=@TimeScan+@T5+','
if not(@T6 is null OR @T6='')
set @TimeScan=@TimeScan+@T6+','
if not(@T7 is null OR @T7='')
set @TimeScan=@TimeScan+@T7+','
if not(@T8 is null OR @T8='')
set @TimeScan=@TimeScan+@T8+','

set @TimeScan=substring(@TimeScan,1,len(@TimeScan)-1)

declare @numScan tinyint
set @numScan= dbo.Func_GetNumTimeScan(@TimeScan)

UPDATE TBLDAILYRECORD 
SET 
 numberOfTimer=@numScan,
 TimeScan=@TimeScan,
 --FirstIn=@FI,
 --FirstOut=@FO,
 --SecondIn=@SI,
 --SecondOut=@SO,
 WorkingHours=ISNULL(@WorkingHours,0),
 OT1=ISNULL(@OT1,0),
 OT2=ISNULL(@OT2,0),
 OTS=ISNULL(@OT3,0),
 AbsenceHours=ISNULL(@A,0),
 AbsenceWarningHours=ISNULL(@AW,0),
--AbsenceMin=isnull(@AMin,0),
 SickTimes=ISNULL(@Sick,0),
 VacationDays=ISNULL(@ANL,0),
 GoHome=ISNULL(@GH,0),
 Pregnant=ISNULL(@Prg,0),
 Mobility=ISNULL(@Mob,0),
 FamilyProblem=ISNULL(@Fam,0),
 --SatHrs=isnull(@SatHrs,0),
 --SpecialLeave=isnull(@SCL,0),
 --CutAttendanceAmount=ISNULL(@Prm,0),
 Checked=ISNULL(@Chk ,0)
WHERE SYSTEMDATE=@DATE AND EmployeeID=@EmpID

