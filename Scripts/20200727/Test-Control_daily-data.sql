declare @scanDate date,@TeamID bigint,@EmpCardNo varchar;
set @scanDate='2020-07-26';
set @TeamID=1442;
set @EmpCardNo=null;
INSERT INTO twrk_control_daily_data
select e.EmployeeCardNo AS CardNo
					 , e.EmployeeNameEng AS NativeName
					 , e.EmployeeNameKh AS ForeignName
					 , SUBSTRING(TimeScan, 1, 5) AS T1
					 , SUBSTRING(TimeScan, 7, 5) AS T2
					 , SUBSTRING(TimeScan, 13, 5) AS T3
					 , SUBSTRING(TimeScan, 19, 5) AS T4
					 , SUBSTRING(TimeScan, 25, 5) AS T5
					 , SUBSTRING(TimeScan, 31, 5) AS T6
					 , SUBSTRING(TimeScan, 37, 5) AS T7
					 , SUBSTRING(TimeScan, 43, 5) AS T8
					 , e.FirstIn AS F_I
					 , e.FirstOut AS F_O
					 , e.SecondIn AS S_I
					 , e.SecondOut AS S_O 
					 , e.ot1stop
					 --<<
					 ,dr.WorkingHours as WorkingHours
					 ,dr.WorkingDayDesc as WDType
					 ,dr.LeaveHours as LeaveHours
					 ,dr.LeaveTypeDesc as LeaveType
					 
					 , CASE dr.AbsenceHours WHEN 0 THEN NULL ELSE dr.AbsenceHours END A
					 , CASE dr.AbsenceWarningHours WHEN 0 THEN NULL ELSE dr.AbsenceWarningHours END AW
					 , CASE dr.SickTimes WHEN 0 THEN NULL ELSE dr.SickTimes END Sick
					 , CASE dr.Pregnant WHEN 0 THEN NULL  ELSE Pregnant END prg
					 , CASE dr.VacationDays WHEN 0 THEN NULL ELSE VacationDays END anl
					 , CASE dr.GoHome WHEN 0 THEN NULL ELSE GoHome END GH
					 , CASE dr.Mobility WHEN 0 THEN NULL ELSE Mobility END Mob
					 , CASE dr.FamilyProblem WHEN 0 THEN NULL ELSE FamilyProblem END Fam
					 , CASE dr.OT1 WHEN 0 THEN NULL ELSE OT1 END OT1
					 , CASE dr.OT2 WHEN 0 THEN NULL ELSE OT2 END OT2
					 , CASE dr.OTS WHEN 0 THEN NULL ELSE dr.OTS END OT3
					 , CASE SatHrs WHEN 0 THEN NULL ELSE SatHrs END SatHrs
					 , CASE dr.SpecialLeave WHEN 0 THEN NULL ELSE dr.SpecialLeave END SCL
					 -->>
					 
					 , dr.CutAttendanceAmount AS Prm
					 , ISNULL([Status], '') AS Status
					 , e.TeamID 
					 , dr.NumberOfTimer
					 --, case when dr.SystemDate is null then @scanDate else dr.SystemDate end SystemDate
					 , dr.SystemDate
					 , e.TeamNameEng
					 , e.TeamNameKH
					 , dr.Checked AS Chk
					 , e.EmployeeID AS EmpID
					
					 , e.DateJoined as DateJoined
					 , dr.TimeRemain as TimeRemain
					 , dr.Validate as Validate
					 , e.FingerprintNumber as FingerprintNumber
					 , e.PositionNameEng
					 , e.PositionNameOther
					 , e.Salary
					 , e.Currency
					 , e.PhotoPath as PhotoPath
					 , '' as DrdTeamID
					 , dr.AbsenceMin AS AMin
					 , e.RecStatus as RecStatus

				from Vew_EmployeeInfo e
						left join (select * from TblDailyRecord r 
									left join (select fld_valu as leaveID ,fld_valu_desc as LeaveTypeDesc from tfield_values where fld_nm='ASK_PMS_TYP') fv on r.LeaveTypeID=fv.leaveID 
									left join (select fld_valu as WorkingDayID,fld_valu_descEng as WorkingDayDesc from tfield_values where fld_nm='WDTYPE') fv1 on r.WorkDayTypeID=fv1.WorkingDayID 
									where SystemDate=@scanDate ) dr  --where SystemDate=@dt01 between @FromDate and @ToDate
						on e.EmployeeID=dr.EmployeeID
				where (case when @TeamID=11111 then 'Y' 
						when e.TeamID= @TeamID  then 'Y' 
						else 'N'
					   end)='Y'
			    and (case when @EmpCardNo is null or @EmpCardNo='' then 'Y' 
							when upper(e.EmployeeCardNo)= @EmpCardNo  then 'Y' 
							else 'N'
						   end)='Y'
				and e.DateJoined <=@scanDate
				and e.RecStatus='A'
				--and e.DateResigned is not null;