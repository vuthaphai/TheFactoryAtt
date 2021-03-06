USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Shift_Add]    Script Date: 07/25/2020 11:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO





ALTER         PROCEDURE [dbo].[Pro_Shift_Add](
@NameEng nVARCHAR(150),
@NameKh nvarchar(150),
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
@ShiftType Tinyint,
@PayForOT2FoodAllowance2 float,
@GetShiftID bigint output

)AS
begin
exec @GetShiftID=dbo.funGenerateNewID;


INSERT INTO TblShift(
ShiftID,
ShiftNameEng,
ShiftNameKh,
FirstIn,
FirstOut,
SecondIn,
SecondOut,
OT1,
OT1Stop,
OT2,
OT2Stop,
OTS,
OTSStop,
BeforeWorkingAllowed,
AfterWorkingAllowed,
PayForShiftAllowance,
PayOT1,
PayOT2,
PayOTs,
PayOnSaturday,
PayOnSunday,
PayHolidays,
PayForOT1FoodAllowance,
PayForOT2FoodAllowance,
PayForOT3FoodAllowance,
ShiftType,
PayForOT2FoodAllowance2
)
VALUES(
@GetShiftID,
@NameEng ,
@NameKh ,
@FirstIn,
@FirstOut,
@SecondIn ,
@SecondOut,
@OT1Start ,
@OT1Stop ,
@OT2Start ,
@OT2Stop ,
@OT3Start ,
@OT3Stop ,
@BWAllowed ,
@AWAllowed ,
@ShiftAllowance,
@PayOT1 ,
@PayOT2 ,
@PayOT3 ,
@PayOnSaturday ,
@PayOnSunday,
@PayOnHoliday,
@PayForOT1FoodAllowance ,
@PayForOT2FoodAllowance ,
@PayForOT3FoodAllowance ,
@ShiftType,
@PayForOT2FoodAllowance2
)

--<<VP
--set @GetShiftID=@@IDENTITY

--Copy to shift movement
--declare @Year char(4),@Month tinyint,@shiftid bigint

--select 
--@Year=vpyear,@Month=vpmonth 
--from tblValidatePayroll
--if @Year is null
-- begin
--  goto LBL_End
-- end

--exec @shiftid=dbo.funGenerateNewID ;
--set @shiftid = @shiftid + 1;


--INSERT INTO TblShift(
--[Year],
--[Month],
--ShiftID,
--ShiftNameEng,
--ShiftNameKh,
--FirstIn,
--FirstOut,
--SecondIn,
--SecondOut,
--OT1,
--OT1Stop,
--OT2,
--OT2Stop,
--OTS,
--OTSStop,
--BeforeWorkingAllowed,
--AfterWorkingAllowed,
--PayForShiftAllowance,
--PayOT1,
--PayOT2,
--PayOTs,
--PayOnSaturday,
--PayOnSunday,
--PayHolidays,
--PayForOT1FoodAllowance,
--PayForOT2FoodAllowance,
--PayForOT3FoodAllowance,
--BackupShiftID,
--ShiftType
--)
--VALUES(
--@Year,
--@Month,
--@shiftid,
--@NameEng ,
--@NameKh ,
--@FirstIn,
--@FirstOut,
--@SecondIn ,
--@SecondOut,
--@OT1Start ,
--@OT1Stop ,
--@OT2Start ,
--@OT2Stop ,
--@OT3Start ,
--@OT3Stop ,
--@BWAllowed ,
--@AWAllowed ,
--@ShiftAllowance,
--@PayOT1 ,
--@PayOT2 ,
--@PayOT3 ,
--@PayOnSaturday ,
--@PayOnSunday,
--@PayOnHoliday,
--@PayForOT1FoodAllowance ,
--@PayForOT2FoodAllowance ,
--@PayForOT3FoodAllowance ,
--@GetShiftID,
--@ShiftType
--)

-->>VP
LBL_End:
end



