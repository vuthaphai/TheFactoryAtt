USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[proControlDailyData]    Script Date: 04/11/2020 09:20:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[proControlDailyData]
	-- Add the parameters for the stored procedure here
	@FromDate date,
	@ToDate date,
	@TeamID BigInt,
	@EmpCardNo varchar(10)
	
AS

declare @cnt int,@todt int,@fromdt int,@scanDate date;



BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--drop table twrk_control_daily_data

--select @cnt= COUNT(systemdate)
--from Vew_EmployeeInfo e
--				left join (select * from TblDailyRecord where SystemDate=@scanDate) dr  
--				on e.EmployeeID=dr.EmployeeID
--		where (case when @TeamID=11111 then 'Y' 
--				when e.TeamID= @TeamID  then 'Y' 
--				else 'N'
--			   end)='Y'
--;
--if @cnt>=0 
	begin
		declare @emp_id bigint,@absent int,@yn varchar(1);
		set @absent =8;
		set @fromdt =DAY(@FromDate);
		set @todt=DAY(@ToDate);
		
		delete from twrk_control_daily_data;
		
		WHILE (@fromdt <=@todt)
		BEGIN
			set @scanDate =CONVERT(date, cast(year(@FromDate) as varchar)+ '/' + CAST( month(@FromDate) as varchar)+'/' + cast(@fromdt as varchar));
			if DATENAME(dw, @scanDate) ='Sunday' 
				begin
					SET @fromdt = @fromdt + 1
					CONTINUE;
				end;--End DATENAME(dw, @scanDate) <>'Sunday'
			DECLARE c_emp CURSOR LOCAL FAST_FORWARD FOR		
					select e.EmployeeID,case when TimeScan is null then 8 end ab
					from Vew_EmployeeInfo e
							left join (select * from TblDailyRecord where SystemDate=@scanDate) dr  
							on e.EmployeeID=dr.EmployeeID
					where (case when @TeamID=11111 then 'Y' 
							when e.TeamID= @TeamID  then 'Y' 
							else 'N'
						   end)='Y'
					and (case when @EmpCardNo is null or @EmpCardNo='' then 'Y' 
							when upper(e.EmployeeCardNo)= @EmpCardNo  then 'Y' 
							else 'N'
						   end)='Y'
					and dr.SystemDate is null
					and e.DateJoined<=@scanDate
					--and e.DateResigned is null;
					and e.RecStatus='A';
			
			OPEN c_emp
			FETCH NEXT FROM c_emp INTO @emp_id,@absent
			WHILE @@FETCH_STATUS = 0
			BEGIN
				INSERT into TblDailyRecord (EmployeeID,SystemDate,LeaveHours,LeaveTypeID) values (@emp_id,@scanDate,@absent,6)
				FETCH NEXT FROM c_emp INTO @emp_id,@absent
			END
			CLOSE c_emp;	
			DEALLOCATE c_emp 		
			SET @fromdt = @fromdt + 1
			--<<----------------------------
			set @yn = dbo.Func_IsPublicHoliday (@scanDate);
			
			update TblDailyRecord 
			set WorkingHours= case when @yn='Y' then 8
									when TimeScan ='' or ISNULL(TimeScan,'N')='N' then  0 
									when NumberOfTimer<=2 then 4
									else 8 end,
				WorkDayTypeID= case when @yn='Y' then 'HD' else 'ND' end,
				LeaveHours= case when @yn='Y' then 0
							when TimeScan ='' or ISNULL(TimeScan,'N')='N' then  8 end,
				LeaveTypeID= case when @yn='Y' then 0
								  when  TimeScan ='' or ISNULL(TimeScan,'N')='N'  then  6 end
			where SystemDate=@scanDate
			and EmployeeID not in (select EmpID from TblAskPermission where LeaveDate=@scanDate)
			--Update Working Day type and Working Hours--------------
			--update TblDailyRecord
			--set WorkingHours=8-AbsenceHours
			--   ,WorkDayTypeID='ND'
			--where LeaveTypeID is null
			--and TimeScan is not null
			--and  SystemDate=@scanDate
			-->>
			
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
				;
		END ;
	end 


		

END
