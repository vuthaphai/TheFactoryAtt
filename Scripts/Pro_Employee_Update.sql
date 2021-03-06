USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Employee_Update]    Script Date: 07/25/2020 11:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


ALTER          procedure [dbo].[Pro_Employee_Update]
(
@Year char(4),
@Month tinyint,
@ECardNo varchar(20),
@SerialCard varchar(25),
@LatinName nvarchar(250),
@OtherName nvarchar(250),
@Sex char(1),
@DOB DATETIME,
@Pob nvarchar(800),
@MaritalStatus varchar(50),
@Spouse nvarchar(250),
@Child tinyint,
@Address nvarchar(800),
@NationalityID int,
@CityID int,
@TeamID bigint,
@GroupID bigint,
@PositionID bigint,
@Tel varchar(250),
@Email varchar(50),
@SSN NVARCHAR(20),
@DriverLicense varchar(20),
@FingerPrint varchar(20),
@Salary float,
@DateJoin datetime,
@DateResigned datetime,
@Memo nvarchar(800),
@Photo image,
@PhotoPath varchar(8000),
@PaymentType varchar(50),
@Currency nchar(1),
@oldAnlUsed float,
@ElectionCardNo Varchar(20),
@FamilyListNo varchar(20),
@recstatus	varchar(2),
@HealthCheckUp	bit,
@WorkBook	bit,
@OldEmpID bigint
)AS
begin

declare @msg  varchar(100)

UPDATE TblEmployee 
SET
EmployeeCardNo=@ECardNo,
SerialCardNo=@SerialCard,
EmployeeNameEng=@LatinName ,
EmployeeNameKH=@OtherName,
Sex=@Sex ,
BirthDate=@DOB ,
PlaceOfBirth=@Pob ,
MaritalStatus=@MaritalStatus ,
Spouse=@Spouse ,
Child=@Child ,
Address=@Address ,
NationalityID=@NationalityID ,
CityID=@CityID,
TeamID=@TeamID,
GroupID=@GroupID,
PositionID=@PositionID,
Tel=@Tel,
Email=@Email,
SSN=@SSN,
DriverLicense=@DriverLicense ,
FingerprintNumber=@FingerPrint ,
Salary=@Salary,
DateJoined=@DateJoin ,
DateResigned=@DateResigned ,
Memo=@Memo ,
Photo=@Photo,
PhotoPath=@PhotoPath,
PaymentType=@PaymentType,
Currency=@Currency,
oldAnlUsed=@oldAnlUsed,
ElectionCardNo=@ElectionCardNo,
FamilyListNo=@FamilyListNo,
RecStatus=@recstatus,
HealthCheckUp=@HealthCheckUp,
WorkBook=@WorkBook,
SystemDate=getdate()
WHERE EmployeeID=@OLdEmpID
--if @Year is null and @Month is null 
	
 begin
	--declare @blnIsActive bit, @vpYear as varchar(4), @vpMonth tinyint 
	--select @vpYear=vpYear, @vpMonth=vpMonth   from tblvalidatepayroll  where dateclosed is null and EmpIDClosed is null
	--	if @vpYear is null and @vpMonth is null
	--	begin
	--		set @blnIsActive=0			
	--	end
	--	else
	--	begin
	--		set @blnIsActive=1			
	--	end
-----------------------------------------------------------------------------
--if @blnIsActive =1 
-- begin
-----Employee employee that is in active payroll
UPDATE TblEmployee 
SET
EmployeeCardNo=@ECardNo,
EmployeeNameEng=@LatinName ,
EmployeeNameKH=@OtherName,
Sex=@Sex ,
BirthDate=@DOB ,
PlaceOfBirth=@Pob ,
MaritalStatus=@MaritalStatus ,
Spouse=@Spouse ,
NationalityID=@NationalityID ,
CityID=@CityID,
SSN=@SSN,
DateJoined=@DateJoin ,
DateResigned=@DateResigned ,
Memo=@Memo ,
Photo=@Photo,
PhotoPath=@PhotoPath,
oldAnlUsed=@oldAnlUsed,
ElectionCardNo=@ElectionCardNo,
FamilyListNo=@FamilyListNo,
RecStatus=@recstatus,
SystemDate=getdate()
WHERE BackupEmpID =@OLdEmpID --AND [year]=@vpYear and [Month]=@vpMonth
--RAISERROR(@PhotoPath ,16,1)
--end

 end
end

