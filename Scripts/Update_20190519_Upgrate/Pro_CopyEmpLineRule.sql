USE [dbUpgrateSoft]
GO
/****** Object:  StoredProcedure [dbo].[Pro_CopyEmpLineRule]    Script Date: 05/19/2019 16:15:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER     procedure [dbo].[Pro_CopyEmpLineRule]
(
 --@Year char(4),
 --@Month tinyint,
 @PEmpID bigint
)as

--DECLARE @BackUpEmpID bigint
--SELECT @BackUpEmpID =BackupEmpID from tblEmployee where EmployeeID=@pEmpID and [Year]=@Year and [Month]=@Month

Declare @LineID int, @Qty float ,@Price float

declare _cur cursor 
 for select LineID ,Qty,Price from TblEmployeeLineRule where EmployeeID=@PEmpID
open _cur
 fetch next from _cur into @LineID,@Qty,@Price

while @@FETCH_STATUS=0 
 begin
	declare @pLineID int
	--select @Plineid=LineID From TblLine WHERE BackupLineID=@LineID and [Year] =@Year and [Month]=@Month
	select @Plineid=LineID From TblLine WHERE LINEID=@LineID 
	if (@Plineid is not null)
		begin
	INSERT INTO TblEmployeeLineRule
	(EmployeeID,LineID,Qty,Price)
	 values(
	@pEmpID,@PLineID,@Qty,@Price
	)
		end
 fetch next from _cur into @LineID,@Qty,@Price
 end 
Close _cur
deallocate _cur