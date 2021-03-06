USE [dbUpgrateSoft]
GO
/****** Object:  StoredProcedure [dbo].[Pro_CopyEmpContract]    Script Date: 05/19/2019 16:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER     PRocedure [dbo].[Pro_CopyEmpContract]
(
--@Year char(4),
--@Month tinyint,
@PEmpID bigint
)
as
--DECLARE @BackUpEmpID bigint
--SELECT @BackUpEmpID=BackupEmpID from tblEmployee where EmployeeID=@pEmpID and [year]=@Year and [Month]=@Month

Declare @EmpID bigint,
@TypeofContract nvarchar(50),
@ContractDate datetime,
@DateJoined datetime,
@NumMonth int,
@Finish bit,
@ContractOrder tinyInt
declare _cur cursor 
 --for select EmpID,TypeofContract,ContractDate,DateJoined,NumMonth,Finish from TblContract where EmpID=@BackupEmpID
 for select EmpID,TypeofContract,ContractDate,DateJoined,NumMonth,Finish from TblContract where EmpID=@PEmpID
open _cur
 fetch next from _cur into @EmpID,@TypeofContract,@ContractDate,@DateJoined,@NumMonth,@Finish 
while @@FETCH_STATUS=0 
 begin	
	SELECT @ContractOrder=Max(ContractOrder) from tblContract where EmpID=@EmpID
	INSERT INTO TblContract
	(EmpID,TypeofContract,ContractDate,DateJoined,NumMonth,Finish,ContractOrder)
	 values(
	  @PEmpID,@TypeOfContract,@ContractDate,@DateJoined,@NumMonth,@Finish,@ContractOrder
	)
fetch next from _cur into @EmpID,@TypeofContract,@ContractDate,@DateJoined,@NumMonth,@Finish 
 end 

Close _cur
deallocate _cur




