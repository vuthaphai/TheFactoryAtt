USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_CopyGroupSeniority]    Script Date: 05/18/2019 17:06:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER  PRocedure [dbo].[Pro_CopyGroupSeniority]
(
@iYear char(4),
@iMonth tinyint,
@PGroupID bigint
)
as
DECLARE @BackUpGroupID bigint
SELECT @BackUpGroupID =BackupGroupID from tblGroup where GroupID=@pGroupID and [year]=@iYear and [Month]=@iMonth

Declare @Year int, @Amount float ,@Percent float

declare _cur cursor 
 for select AncientBegin,AncientAmount,AncientPercentage from TblAncient where GroupID=@BackupGroupID
open _cur
 fetch next from _cur into @Year,@Amount,@Percent
while @@FETCH_STATUS=0 
 begin
	
	INSERT INTO TblAncient
	(GroupID,AncientBegin,AncientAmount,AncientPercentage)
	 values(
	@pGroupID,@Year,@Amount,@Percent
	)
 fetch next from _cur into @Year,@Amount,@Percent
 end 

Close _cur
deallocate _cur


