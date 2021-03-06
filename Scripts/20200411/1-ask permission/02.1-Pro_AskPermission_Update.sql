USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_AskPermission_Update]    Script Date: 08/22/2019 03:27:42 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER    procedure [dbo].[Pro_AskPermission_Update](
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
--DECLARE @MaxDate datetime
--select @MaxDate= max(todate) from TblAskPermission 
--where empID=@EmpID and askID<>@AskID

--set @Maxdate=isnull(@Maxdate,'1990/1/1')

--IF @FromDate <=@MaxDate
-- begin
--	RAISERROR ('Date already took or less than last date of ask permission.',16,1)
--	goto _LBLFINISH
-- end

Update TblAskPermission
	SET EmpID=@EmpID,
		TransactionDate=@TransactionDate,
		AskPermissionTypeID=@AskPermissionTypeId,		
		[Description]=@Desc,
		LeaveDate=@LeaveDate,
		LeaveHours=@LeaveHours,		
		UserID=@UserID
		where askID=@askID
--_LBLFINISH:
end
