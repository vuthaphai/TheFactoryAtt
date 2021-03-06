USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Group_Update]    Script Date: 07/25/2020 11:35:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO










ALTER          PROCEDURE [dbo].[Pro_Group_Update](
@GroupID bigint,
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
@AllowOTHalfHrs bit,
@AttAllowanceHalf float
)AS 

UPDATE TblGroup 
SET 
GroupNameEng=@NativeName,
GroupNameKh=@ForiegnName,
[Description]=@Description,
AttendanceAllowance=@AttendanceAllowance,
AnnualLeaveDaysAllow=@AnnualLeaveDaysAllow,
PregnantDaysAllow =@PregnantDaysAllow,
PregnantPercent=@PregnantPercent,
GohomePercent=@GohomePercent,
EndcontractPercent=@EndcontractPercent,
PayForOT1=@PayForOT1,
PayForOT2=@PayForOT2,
PayForOTS=@PayForOT3,
PayForSaturday=@PayForSaturday,
PayForSunday=@PayForSunday,
PayForHoliday=@PayForHoliday,
PayForOT1FoodAllowance=@PayForOT1FoodAllowance,
PayForOT2FoodAllowance=@PayForOT2FoodAllowance,
PayForOT3FoodAllowance=@PayForOT3FoodAllowance,
ShiftAllowance =@ShiftAllowance,
NeverAbsence=@NeverAbsence,
AllowOTHalfHrs=@AllowOTHalfHrs,
AttAllowanceHalf=@AttAllowanceHalf
WHERE GroupID=@GroupID


