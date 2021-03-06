USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_AskPermission_Add]    Script Date: 08/22/2019 03:26:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER    procedure [dbo].[Pro_AskPermission_Add](
@AskID BigInt,
@EmpID BigInt,
@TransactionDate Datetime,
@AskPermissionTypeId int,
@Desc Nvarchar(4000),
@LeaveDate date,
@LeaveHours int,
@UserID Int
)
as 
begin

DECLARE @cnt int
--select @MaxDate= max(todate) from TblAskPermission 
--where empID=@EmpID

--set @Maxdate=isnull(@Maxdate,'1990/1/1')

--IF @FromDate <=@MaxDate
-- begin
--	RAISERROR ('Date already took or less than last date of ask permission.',16,1)
--	goto _LBLFINISH
-- end
select @cnt=COUNT(askid) from TblAskPermission where askID=@AskID;

if @cnt>0
	begin
		Update TblAskPermission
		SET EmpID=@EmpID,
			TransactionDate=@TransactionDate,
			AskPermissionTypeID=@AskPermissionTypeId,		
			[Description]=@Desc,
			LeaveDate=@LeaveDate,
			LeaveHours=@LeaveHours,		
			UserID=@UserID
			where askID=@askID;
	end;
else
	begin
		INSERT INTO TblAskPermission
				(
				askID,
				EmpID,
				TransactionDate,
				AskPermissionTypeID,
				[Description],
				LeaveDate,
				LeaveHours,
				UserID
				)values(

				@AskID,
				@EmpID,
				@TransactionDate,
				@AskPermissionTypeId,
				@Desc,
				@LeaveDate,
				@LeaveHours,
				@UserID)
				;
	end;
--<<VP
set @cnt =0;

select @cnt=COUNT(EmployeeID) from TblDailyRecord where EmployeeID=@EmpID and SystemDate =@LeaveDate;

if @cnt>0
	begin
		--<<
			 update TblDailyRecord 
		     set  LeaveHours=@LeaveHours,
				  LeaveTypeID=@AskPermissionTypeId,	
				  WorkDayTypeID ='ND'			 
			 where EmployeeID=@EmpID and SystemDate =@LeaveDate;
		-->>
		if @AskPermissionTypeId=1 --VacationDays
			begin
			    update TblDailyRecord 
			    set  VacationDays=@LeaveHours 
				where EmployeeID=@EmpID and SystemDate =@LeaveDate;
			end
		else if @AskPermissionTypeId=2 --SpecialLeave
			begin
				 update TblDailyRecord 
			     set  SpecialLeave=@LeaveHours 
				 where EmployeeID=@EmpID and SystemDate =@LeaveDate;
			end
		else if @AskPermissionTypeId=3 --No Pay Leave
			begin
			    update TblDailyRecord 
			    set  AbsenceWarningHours=@LeaveHours 
				where EmployeeID=@EmpID and SystemDate =@LeaveDate;
			end
		
		else if @AskPermissionTypeId=4 --SickTimes
			begin
				 update TblDailyRecord 
			     set  SickTimes=@LeaveHours 
				 where EmployeeID=@EmpID and SystemDate =@LeaveDate;
			end;
		else if @AskPermissionTypeId=5 --Pregnant
			begin
				 update TblDailyRecord 
			     set  Pregnant=@LeaveHours 
				 where EmployeeID=@EmpID and SystemDate =@LeaveDate;
			end;
			
	end; --end if @cnt>0
else --end if @cnt>0
	begin
		
		insert into TblDailyRecord (EmployeeID,SystemDate,LeaveHours,LeaveTypeID,WorkDayTypeID)
			  values (@EmpID,@LeaveDate, @LeaveHours,@AskPermissionTypeId,'ND') 
	
		if @AskPermissionTypeId=1 --VacationDays
			begin
			  insert into TblDailyRecord (EmployeeID,SystemDate,VacationDays)
			  values (@EmpID,@LeaveDate, @LeaveHours) 
			end
		else if @AskPermissionTypeId=2 --SpecialLeave
			begin
			  insert into TblDailyRecord (EmployeeID,SystemDate,SpecialLeave)
			  values (@EmpID,@LeaveDate, @LeaveHours) 
			end
		else if @AskPermissionTypeId=3 --No Pay Leave
			begin
			   insert into TblDailyRecord (EmployeeID,SystemDate,AbsenceWarningHours)
			   values (@EmpID,@LeaveDate, @LeaveHours) 			   
			end		
		else if @AskPermissionTypeId=4 --SickTimes
			begin
			   insert into TblDailyRecord (EmployeeID,SystemDate,SickTimes)
		       values (@EmpID,@LeaveDate, @LeaveHours) 
			end;
		else if @AskPermissionTypeId=5 --Pregnant
			begin
			  insert into TblDailyRecord (EmployeeID,SystemDate,Pregnant)
		      values (@EmpID,@LeaveDate, @LeaveHours) 
			end;
	end;--end else --end if @cnt>0

-->>VP


end
