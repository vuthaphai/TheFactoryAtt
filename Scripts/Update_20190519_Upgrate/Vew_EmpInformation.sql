USE [dbNasmi]
GO

/****** Object:  View [dbo].[Vew_EmpInformation]    Script Date: 05/04/2019 10:19:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[Vew_EmpInformation]
AS
SELECT dbo.TblEmployee.Year, dbo.TblEmployee.Month, dbo.TblEmployee.EmployeeID, dbo.TblEmployee.EmployeeCardNo, dbo.TblEmployee.SerialCardNo, 
               dbo.TblEmployee.EmployeeNameEng, dbo.TblEmployee.EmployeeNameKh, dbo.TblEmployee.Sex, dbo.TblEmployee.BirthDate, dbo.TblEmployee.PlaceOfBirth, 
               dbo.TblEmployee.MaritalStatus, dbo.TblEmployee.Child, dbo.TblEmployee.Spouse, dbo.TblEmployee.Address, dbo.TblEmployee.NationalityID, 
               dbo.TblEmployee.CityID, dbo.TblEmployee.TeamID, dbo.TblEmployee.GroupID, dbo.TblEmployee.PositionID, dbo.TblEmployee.Tel, dbo.TblEmployee.Email, 
               dbo.TblEmployee.SSN, dbo.TblEmployee.DriverLicense, dbo.TblEmployee.FingerprintNumber, dbo.TblEmployee.Salary, dbo.TblEmployee.DateJoined, 
               dbo.TblEmployee.DateResigned, dbo.TblEmployee.Memo, dbo.TblEmployee.Photo, dbo.TblEmployee.SystemDate, dbo.TblTeam.TeamNameEng, 
               dbo.TblTeam.TeamNameKh, dbo.TblTeam.ShiftID, dbo.TblTeam.Description, dbo.TblTeam.AbsenceAllowed, dbo.TblTeam.AbsenceWarningAllowed, 
               dbo.TblTeam.NumberOfSickdayAllowed, dbo.TblTeam.CheckedMinistry, dbo.TblShift.ShiftNameEng, dbo.TblShift.ShiftNameKh, dbo.TblShift.WorkingDays, 
               dbo.TblShift.WorkingHours, dbo.TblShift.FirstIn, dbo.TblShift.FirstOut, dbo.TblShift.SecondIn, dbo.TblShift.SecondOut, dbo.TblShift.OT1, dbo.TblShift.OT2, 
               dbo.TblShift.OTS, dbo.TblShift.BeforeWorkingAllowed, dbo.TblShift.AfterWorkingAllowed, dbo.TblShift.PayForShiftAllowance AS ShiftPayForShiftAllowance, 
               dbo.TblShift.PayOT1 AS ShiftPayOT1, dbo.TblShift.PayOT2 AS ShiftPayOT2, dbo.TblShift.PayOTS AS ShiftPayOTS, 
               dbo.TblShift.PayOnSaturday AS ShiftPayOnSaturday, dbo.TblShift.PayOnSunday AS ShiftPayOnSunday, dbo.TblShift.PayHolidays AS ShiftPayOnHoliday, 
               dbo.TblShift.PayForOT1FoodAllowance AS ShiftPayForOT1FoodAllowance, dbo.TblShift.PayForOT2FoodAllowance AS ShiftPayForOT2FoodAllowance, 
               dbo.TblShift.PayForOT3FoodAllowance AS ShiftPayForOT3FoodAllowance, dbo.TblCity.CityNameEng, dbo.TblCity.CityNameKh, dbo.TblPosition.PositionNameEng, 
               dbo.TblPosition.PositionNameOther, dbo.TblGroup.GroupNameEng, dbo.TblGroup.GroupNameKh, dbo.TblGroup.AttendanceAllowance, 
               dbo.TblGroup.AnnualLeaveDaysAllow, dbo.TblGroup.PregnantDaysAllow, dbo.TblGroup.PregnantPercent AS GrpPregnantPercent, 
               dbo.TblGroup.GohomePercent AS GrpGohomePercent, dbo.TblGroup.EndcontractPercent AS GrpEndcontractPercent, 
               dbo.TblGroup.PayForOT1 AS GrpPayForOT1, dbo.TblGroup.PayForOT2 AS GrpPayForOT2, dbo.TblGroup.PayForOTS AS GrpPayForOT3, 
               dbo.TblGroup.PayForSaturday AS GrpPayForSaturday, dbo.TblGroup.PayForSunday AS GrpPayForSunday, dbo.TblGroup.PayForHoliday AS GrpPayForHoliday, 
               dbo.TblGroup.PayForOT1FoodAllowance AS GrpPayForOT1FoodAllowance, dbo.TblGroup.PayForOT2FoodAllowance AS GrpPayForOT2FoodAllowance, 
               dbo.TblGroup.PayForOT3FoodAllowance AS GrpPayForOT3FoodAllowance, dbo.TblGroup.NeverAbsence AS GrpNeverAbsence, 
               dbo.TblGroup.ShiftAllowance AS GrpShiftAllowance, dbo.TblCompanyInfo.WorkingHoursPerday, dbo.TblShift.OT1Stop, dbo.TblShift.OT2Stop, 
               dbo.TblShift.OTsStop, dbo.TblTeam.BackupTeamID, dbo.TblGroup.BackupGroupID, dbo.TblEmployee.BackupEmpID, dbo.TblEmployee.PhotoPath, 
               dbo.TblCompanyInfo.SaturdayWorkingHours, dbo.TblNationality.NationalityNameKh, dbo.TblNationality.NationalityNameEng, dbo.TblEmployee.Currency, 
               dbo.TblEmployee.paymenttype, dbo.TblGroup.AllowOTHalfHrs, dbo.TblEmployee.ElectionCardNo, dbo.TblEmployee.FamilyListNo, dbo.TblEmployee.Stop, 
               dbo.TblShift.ShiftType, dbo.TblShift.PayForOT2FoodAllowance2, dbo.TblGroup.AttAllowanceHalf, dbo.TblEmployee.RecStatus
FROM  dbo.TblCompanyInfo CROSS JOIN
               dbo.TblEmployee INNER JOIN
               dbo.TblTeam ON dbo.TblEmployee.TeamID = dbo.TblTeam.TeamID LEFT OUTER JOIN
               dbo.TblNationality ON dbo.TblEmployee.NationalityID = dbo.TblNationality.NationalityID LEFT OUTER JOIN
               dbo.TblCity ON dbo.TblEmployee.CityID = dbo.TblCity.CityID LEFT OUTER JOIN
               dbo.TblShift ON dbo.TblTeam.ShiftID = dbo.TblShift.ShiftID LEFT OUTER JOIN
               dbo.TblGroup ON dbo.TblEmployee.GroupID = dbo.TblGroup.GroupID LEFT OUTER JOIN
               dbo.TblPosition ON dbo.TblEmployee.PositionID = dbo.TblPosition.PositionID
where RecStatus = 'A'



GO


