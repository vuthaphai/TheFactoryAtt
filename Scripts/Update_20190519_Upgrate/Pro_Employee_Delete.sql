USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_Employee_Delete]    Script Date: 05/18/2019 07:10:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


ALTER          procedure [dbo].[Pro_Employee_Delete]
(
@OldEmpID bigint
)AS
begin

declare @msg  varchar(100)

UPDATE TblEmployee 
SET
 RecStatus ='D', 
 SystemDate =getdate()

WHERE EmployeeID=@OLdEmpID or Backupempid=@OLdEmpID

end

