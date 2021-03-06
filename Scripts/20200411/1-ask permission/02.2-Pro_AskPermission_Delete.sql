USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_AskPermission_Delete]    Script Date: 08/22/2019 03:53:34 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO



ALTER   procedure [dbo].[Pro_AskPermission_Delete](
@askID Bigint
)
as 

-- bonnra conitnue

Declare @EmpId bigint,@LeaveDate date,@AskPermissionTypeId int,@LeaveHours decimal
SELECT @Empid=Empid,@AskPermissionTypeId=AskPermissionTypeID,@LeaveDate=LeaveDate from tblAskPermission WHERE AskID=@AskID

--IF (@AskType=10 OR @AskType=11)
--    BEGIN
--	DECLARE @EmpCardNo varchar(10)
--	SELECT @EmpCardNo=EmployeeCardNo From tblEmployee WHERE Employeeid=@EmpID
--	UPDATE tblEmployee SET DateResigned=Null,Stop=Null WHERE EmployeeCardNo=@EmpCardNo
--    END
set @LeaveHours=0;
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


DELETE FROM  TblAskPermission where askID=@askID
