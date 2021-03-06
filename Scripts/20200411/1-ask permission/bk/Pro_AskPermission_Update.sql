USE [dbNeoCam2]
GO
/****** Object:  StoredProcedure [dbo].[Pro_AskPermission_Update]    Script Date: 08/14/2019 05:38:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER    procedure [dbo].[Pro_AskPermission_Update](
@askID int,
@EmpID BigInt,
@TOAP int,
@Desc nvarchar(4000),
@FromDate Datetime,
@ToDate datetime,
@DocumentJoint bit,
@Observation Nvarchar(10),
@UserID int
)
as 
begin
DECLARE @MaxDate datetime
select @MaxDate= max(todate) from TblAskPermission 
where empID=@EmpID and askID<>@AskID

set @Maxdate=isnull(@Maxdate,'1990/1/1')

IF @FromDate <=@MaxDate
 begin
	RAISERROR ('Date already took or less than last date of ask permission.',16,1)
	goto _LBLFINISH
 end

Update TblAskPermission
SET EmpID=@EmpID,
SystemDate=substring(cast(getdate() as varchar),1,12), --System date,
TypeOfAPermission=@TOAP,
[Description]=@Desc,
FromDate=@FromDate,
ToDate=@ToDate,
DocumentJoint=@DocumentJoint,
Observation=@Observation,UserID=@UserID
where askID=@askID
_LBLFINISH:
end
