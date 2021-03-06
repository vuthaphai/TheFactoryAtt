USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_Shift_Update]    Script Date: 05/18/2019 19:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO







ALTER      PROCEDURE [dbo].[Pro_Shift_Update](
@ShiftID bigint,
@NameEng nVARCHAR(150),
@NameKh nvarchar(100),
@FirstIn varchar(5),
@FirstOut varchar(5),
@SecondIn varchar(5),
@SecondOut varchar(5),
@OT1Start varchar(5),
@OT1Stop varchar(5),
@OT2Start varchar(5),
@OT2Stop varchar(5),
@OT3Start varchar(5),
@OT3Stop varchar(5),
@BWAllowed tinyint,
@AWAllowed tinyint,
@ShiftAllowance float,
@PayOT1 float,
@PayOT2 float,
@PayOT3 float,
@PayOnSaturday float,
@PayOnSunday float,
@PayOnHoliday float,
@PayForOT1FoodAllowance float,
@PayForOT2FoodAllowance float,
@PayForOT3FoodAllowance float,
@ShiftType tinyint,
@PayForOT2FoodAllowance2 float
)AS
UPDATE TblShift SET
ShiftNameEng=@NameEng,
ShiftNameKh =@NameKh,
FirstIN = @FirstIN,
FirstOut= @FirstOut,
SecondIn = @SecondIn,
SecondOut = @SecondOut,
OT1=@OT1Start,
OT1Stop=@OT1Stop,
OT2=@OT2Start,
OT2Stop=@OT2Stop,
OTS=@OT3Start,
OTSStop=@OT3Stop,
BeforeWorkingAllowed=@BWAllowed,
AfterWorkingAllowed=@AWAllowed,
PayForShiftAllowance= @ShiftAllowance,
PayOT1=@PayOT1,
PayOT2=@PayOT2,
PayOTs=@PayOT3,
PayOnSaturday=@PayOnSaturday,
PayOnSunday=@PayOnSunday,
PayHolidays=@PayOnHoliday,
PayForOT1FoodAllowance=@PayForOT1FoodAllowance,
PayForOT2FoodAllowance=@PayForOT2FoodAllowance,
PayForOT3FoodAllowance=@PayForOT3FoodAllowance,
ShiftType=@ShiftType,
PayForOT2FoodAllowance2=@PayForOT2FoodAllowance2
WHERE ShiftID=@ShiftID




