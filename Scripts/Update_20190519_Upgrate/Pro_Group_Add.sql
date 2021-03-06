USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_Group_Add]    Script Date: 05/18/2019 16:09:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO









ALTER         PROCEDURE [dbo].[Pro_Group_Add](
@Year char(4),
@Month tinyint,
@NativeName nvarchar(150),
@ForiegnName  nvarchar(150),
@Description nvarchar(800),
@AttendanceAllowance float,
@AnnualLeaveDaysAllow float,
@PregnantDaysAllow float,
@PregnantPercent float,
@GohomePercent float,
@EndcontractPercent float,
@PayForOT1 bit,
@PayForOT2 bit,
@PayForOT3 bit,
@PayForSaturday bit,
@PayForSunday bit,
@PayForHoliday bit,
@PayForOT1FoodAllowance bit,
@PayForOT2FoodAllowance bit,
@PayForOT3FoodAllowance bit,
@ShiftAllowance BIT,
@NeverAbsence bit,
@BackupGroupID  bigint,
@AllowOTHalfHrs BIT,
@AttAllowanceHalf float,
@getNewGroupID bigint output
)AS 

exec @getNewGroupID=dbo.funGenerateNewID;

INSERT INTO TblGroup 
(
[Year],
[Month],
GroupID,
GroupNameEng,
GroupNameKh,
[Description],
AttendanceAllowance,
AnnualLeaveDaysAllow,
PregnantDaysAllow,
PregnantPercent,
GohomePercent,
EndcontractPercent,
PayForOT1,
PayForOT2,
PayForOTS,
PayForSaturday,
PayForSunday,
PayForHoliday,
PayForOT1FoodAllowance ,
PayForOT2FoodAllowance ,
PayForOT3FoodAllowance ,
ShiftAllowance ,
NeverAbsence,
BackupGroupID,
AttAllowanceHalf,
AllowOTHalfHrs
)
VALUES(
@Year,
@Month,
@getNewGroupID,
@NativeName,
@ForiegnName,
@Description,
@AttendanceAllowance ,
@AnnualLeaveDaysAllow,
@PregnantDaysAllow,
@PregnantPercent ,
@GohomePercent,
@EndcontractPercent,
@PayForOT1,
@PayForOT2,
@PayForOT3,
@PayForSaturday,
@PayForSunday,
@PayForHoliday,
@PayForOT1FoodAllowance ,
@PayForOT2FoodAllowance ,
@PayForOT3FoodAllowance ,
@ShiftAllowance,
@NeverAbsence,
@BackupGroupID,
@AttAllowanceHalf,
@AllowOTHalfHrs
)
--SET @GetNewGroupID=@@IDENTITY

/*
--Copy to Group 
declare @Year char(4),@Month tinyint

select 
@Year=vpyear,@Month=vpmonth 
from tblValidatePayroll
if @Year is null
 begin
  goto LBL_End
 end

INSERT INTO TblGroup 
(
[Year],
[Month],
GroupID,
GroupNameEng,
GroupNameKh,
[Description],
AttendanceAllowance,
AnnualLeaveDaysAllow,
PregnantDaysAllow,
PregnantPercent,
GohomePercent,
EndcontractPercent,
PayForOT1,
PayForOT2,
PayForOTS,
PayForSaturday,
PayForSunday,
PayForHoliday,
PayForOT1FoodAllowance ,
PayForOT2FoodAllowance ,
PayForOT3FoodAllowance ,
ShiftAllowance ,
NeverAbsence
)
VALUES(
@Year,
@Month,
@GroupID,
@NativeName,
@ForiegnName,
@Description,
@AttendanceAllowance ,
@AnnualLeaveDaysAllow,
@PregnantDaysAllow,
@PregnantPercent ,
@GohomePercent,
@EndcontractPercent,
@PayForOT1,
@PayForOT2,
@PayForOT3,
@PayForSaturday,
@PayForSunday,
@PayForHoliday,
@PayForOT1FoodAllowance ,
@PayForOT2FoodAllowance ,
@PayForOT3FoodAllowance ,
@ShiftAllowance,
@NeverAbsence
)

LBL_End:

*/


