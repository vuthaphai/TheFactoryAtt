USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_CopyGroupAnnualLeaveIncreasement]    Script Date: 05/18/2019 17:01:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER  PRocedure [dbo].[Pro_CopyGroupAnnualLeaveIncreasement]
(
@Year char(4),
@Month tinyint,
@PGroupID bigint
)
as
DECLARE @BackUpGroupID bigint
SELECT @BackUpGroupID =BackupGroupID from tblGroup where GroupID=@pGroupID  and [year]=@Year and [Month]=@Month

Declare @gYear int, @gDays float 

declare _cur cursor 
 for select [Year],Days from TblAnnualLeave where GroupID=@BackupGroupID
open _cur
 fetch next from _cur into @gYear,@gDays
while @@FETCH_STATUS=0 
 begin
	INSERT INTO TblAnnualLeave
	(GroupID,[Year],Days)
	 values(
	@pGroupID,@gYear,@gDays
	)
 fetch next from _cur into @gYear,@gDays
 end 

Close _cur
deallocate _cur


