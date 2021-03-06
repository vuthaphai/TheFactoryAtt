USE [dbUpgrateSoft]
GO
/****** Object:  StoredProcedure [dbo].[Pro_InsertToDailyRecord]    Script Date: 05/20/2019 23:06:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER    procedure [dbo].[Pro_InsertToDailyRecord]
(
@Label varchar(5),
@DateScan datetime,
@itimes varchar(50),
@MachineTypeID tinyint
) as 
begin
--set @Label=1
--set @DateScan='2006/09/01'
declare @getEmpID bigint,@getBackupEmpID bigint



begin
    --NotactiveParoll:
	IF @MachineTypeID=1 
	  begin 
		select @getEmpID=EmployeeID,@getBackupEmpID=ISNULL(BackupEmpID,EmployeeID) 
		From TblEmployee 
		where [year] is null and [Month] is null
		and SerialCardNo =(select SerialCardNo From TblCardStorage where Label=@Label)
	  end
	IF @MachineTypeID=2
	  begin 

		--if LEN(@Label)=1
		--		set @Label='0000'+@Label
		--	else if LEN(@Label)=2
		--		set @Label='000'+@Label
		--	else if LEN(@Label)=3
		--		set @Label='00'+@Label
		--	else if LEN(@Label)=4
		--		set @Label='0'+@Label
		select @getEmpID=EmployeeID,@getBackupEmpID=ISNULL(BackupEmpID,EmployeeID) From TblEmployee where [year] is null and [Month] is null
		and FingerPrintNumber =@Label
	  end	
	IF @MachineTypeID=3
	  begin
		select @getEmpID=EmployeeID,@getBackupEmpID=ISNULL(BackupEmpID,EmployeeID) 
		From TblEmployee 
		where [year] is null and [Month] is null
		and SerialCardNo=@Label
	  end
	IF @MachineTypeID=4
	  begin 	  		
		select @getEmpID=EmployeeID,@getBackupEmpID=ISNULL(BackupEmpID,EmployeeID) 
		From TblEmployee 
		where [year] is null and [Month] is null
		and FingerPrintNumber =@Label
	 end	
end


set @GetEmpID= ISNULL(@GetEmpID,0)
declare @timescan varchar(4000)
set @timescan='-1'
if @GetEmpID =0
 begin
 goto EndLbl --do nothing
 end

declare @FI_Rule varchar(5),@FO_Rule varchar(5),@SI_Rule varchar(5) ,@SO_Rule varchar(5)
select 
	@FI_Rule=FIrstIn,
	@FO_Rule=FirstOut,
	@SI_Rule=SecondIn,
	@SO_Rule=SecondOut
 from Vew_EmpInformation 
 where employeeid=@GetEmpID

select @timescan=timescan 
from tbldailyrecord 
where systemdate=@DateScan 
and employeeid=@GetEmpID

set @timescan= isnull(@timescan,'-1')
if @timescan ='-1' 
 begin
	Insert into tblDailyrecord (employeeid,systemdate,TimeScan,BackupEmpID,FirstIn,FirstOut,SecondIn,SecondOut) 
	values(@GetEmpID,@DateScan,@itimes,@GetBackupEmpID,@FI_Rule,@FO_Rule,@SI_Rule,@SO_Rule)
 end
else
 begin
	if @timescan='' or @timeScan=' ' 
	 	begin
			set @timescan=@itimes	
 		end   
	else
 		begin
			set @timescan=@timescan + ',' + @itimes	
	 	end
	
	declare @numScan int
	set @numScan =0
	set @numScan=dbo.Func_GetNumScan(@itimes)
	Update TblDailyRecord 
	set TimeScan=@timescan,
		numberoftimer=@numScan,
		absenceHours=0,
		checked=0,
		status=null,
		remark=null,
		FirstIn=@FI_Rule,
		FirstOut=@FO_Rule,
		SecondIn=@SI_Rule,
		SecondOut=@SO_Rule,
		cutAttendanceAmount=1	--Allow time attendance allowance
	where employeeid=@GetEmpID 
	and systemdate=@DateScan
	
 end
EndLbl:
end

