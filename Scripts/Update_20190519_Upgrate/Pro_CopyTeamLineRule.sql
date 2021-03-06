USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_CopyTeamLineRule]    Script Date: 05/18/2019 15:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER   procedure [dbo].[Pro_CopyTeamLineRule]
(
 @Year char(4),
 @Month tinyint ,
 @pTeamID bigint
)as

DECLARE @BackUpTeamID bigint
SELECT @BackUpTeamID = BackupTeamID from tblTeam where TeamID=@pTeamID and [year]=@Year and [month]=@Month

Declare @LineID int, @Qty float ,@Price float,@Amount float

declare _cur cursor 
 for select LineID ,Qty,Price,Amount from TblTeamLineRule where TeamID=@BackupTeamID 
open _cur
 fetch next from _cur into @LineID,@Qty,@Price,@Amount

while @@FETCH_STATUS=0 
 begin
	declare @pLineID int
	select @Plineid=LineID From TblLine WHERE BackupLineID=@LineID and [Year]=@Year and [Month]=@Month

	INSERT INTO TblTeamLineRule
	(TeamID,LineID,Qty,Price,Amount)
	 values(
	@pTeamID,@PLineID,@Qty,@Price,@Amount
	)


 fetch next from _cur into @LineID,@Qty,@Price,@Amount
 end 
Close _cur
deallocate _cur


