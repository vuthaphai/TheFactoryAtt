USE [dbNeoCam2]
GO
/****** Object:  StoredProcedure [dbo].[Pro_AskPermission_Add]    Script Date: 08/14/2019 05:37:17 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER    procedure [dbo].[Pro_AskPermission_Add](
@EmpID BigInt,
@TOAP int,
@FromDate Datetime,
@Desc Nvarchar(4000),
@ToDate datetime,
@getAskID int output,
@DocumentJoint bit,
@Observation  Nvarchar(10),
@UserID Int
)
as 
begin
DECLARE @MaxDate datetime
select @MaxDate= max(todate) from TblAskPermission 
where empID=@EmpID

set @Maxdate=isnull(@Maxdate,'1990/1/1')

IF @FromDate <=@MaxDate
 begin
	RAISERROR ('Date already took or less than last date of ask permission.',16,1)
	goto _LBLFINISH
 end

INSERT INTO TblAskPermission
(
EmpID,
SystemDate,
TypeOfAPermission,
[Description],
FromDate,
ToDate,
DocumentJoint,
Observation,
UserID
)values(

@EmpID,
substring(cast(getdate() as varchar),1,12), --System date
@TOAP,
@Desc,
@FromDate,
@ToDate,
@DocumentJoint,
@Observation,
@UserID
)
set @getAskID= @@IDENTITY --In order to return askID
_LBLFINISH:
end
