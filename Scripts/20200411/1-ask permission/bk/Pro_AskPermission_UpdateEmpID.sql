USE [dbNeoCam2]
GO
/****** Object:  StoredProcedure [dbo].[Pro_AskPermission_UpdateEmpID]    Script Date: 08/14/2019 05:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [dbo].[Pro_AskPermission_UpdateEmpID](
	@Year char(4),
	@Month tinyint
)
AS

declare @EmpID BigInt,@SystemDate datetime,@TOAPer int,@FromDate datetime,@ToDate as datetime ,@BackupEmpID BigInt
declare cur cursor for 
SELECT EmpID,SystemDate,@TOAPer,@FromDate,@ToDate,@BackupEmpID 
FROM TblAskPermission 
where year(Systemdate)=@Year and month(Systemdate)=@Month
open cur
 fetch next from cur into @EmpID,@SystemDate,@TOAPer,@FromDate,@ToDate,@BackupEmpID
WHILE @@FETCH_STATUS=0
 BEGIN
	DECLARE @GetNewEmpID BIGINT

	SELECT @GetNewEmpID=EmployeeID FROM TblEmployee WHERE [Year]=@Year and [Month]=@Month and BackupEmpID=@BackupEmpID

	update TblAskPermission set EmpID=@GetNewEmpID WHERE BackupEmpID=@BackupEmpID
	PRINT @EmpID
 fetch next from cur into @EmpID,@SystemDate,@TOAPer,@FromDate,@ToDate,@BackupEmpID
 END
CLOSE CUR
DEALLOCATE CUR


