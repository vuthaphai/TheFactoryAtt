USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_CopyGroupLineRule]    Script Date: 05/18/2019 17:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER   procedure [dbo].[Pro_CopyGroupLineRule]
(@Year char(4),
 @Month tinyint,
 @PGroupID bigint
)as

DECLARE @BackUpGroupID bigint
SELECT @BackUpGroupID =BackupGroupID from tblGroup where GroupID=@pGroupID  and [Year]=@Year and [Month]=@Month

Declare @LineID int, @Qty float ,@Price float

declare _cur cursor 
 for select LineID ,Qty,Price from TblGroupLineRule where GroupID=@BackupGroupID
open _cur
 fetch next from _cur into @LineID,@Qty,@Price

while @@FETCH_STATUS=0 
 begin
	declare @pLineID int
	select @Plineid=LineID From TblLine WHERE BackupLineID=@LineID and [Year]=@Year and [Month]=@Month

	INSERT INTO TblGroupLineRule
	(GroupID,LineID,Qty,Price)
	 values(
	@pGroupID,@PLineID,@Qty,@Price
	)


 fetch next from _cur into @LineID,@Qty,@Price
 end 
Close _cur
deallocate _cur


