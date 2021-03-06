USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Employee_Add]    Script Date: 07/25/2020 11:19:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



ALTER       procedure [dbo].[Pro_Employee_Add]
(
@Year char(4),
@Month tinyint,
@ECardNo varchar(20),
@SerialCard varchar(20),
@EmployeeNameKH nvarchar(250),
@EmployeeNameEng nvarchar(250),
@Sex char(1),
@DOB DATETIME,
@Pob nvarchar(800),
@MaritalStatus varchar(50),
@Spouse nvarchar(250),
@Child tinyint,
@Address nvarchar(800),
@NationalityID int,
@CityID bigint,
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
@Memo Nvarchar(800),
@Photo image,
@PhotoPath varchar(8000),
@PaymentType varchar(50),
@BackupEmpID bigint,
@Currency nchar(1),
@oldAnlUsed float,
@ElectionCardNo Varchar(20),
@FamilyListNo varchar(20),
@recstatus	varchar(1),
@HealthCheckUp	bit,
@WorkBook	bit,
@NewEmpID bigint output
)AS

--declare @emp_id bigint;
--select @NewEmpID= replace(convert(varchar, getdate(),111),'/','') + replace(convert(varchar, getdate(),114),':','') ;
exec @NewEmpID=dbo.funGenerateNewID;

INSERT INTO TblEmployee 
(
[Year],
[Month],
EmployeeID,
EmployeeCardNo,
SerialCardNo,
EmployeeNameKH,
EmployeeNameEng ,
Sex,
BirthDate ,
PlaceOfBirth ,
MaritalStatus,
Spouse,
Child,
Address,
NationalityID ,
CityID,
TeamID,
GroupID,
PositionID,
Tel,
Email,
SSN,
DriverLicense ,
FingerprintNumber,
Salary,
DateJoined,
DateResigned,
Memo,
Photo,
PhotoPath,
PaymentType,
SystemDate,
currency,
oldAnlUsed,
BackupEmpID,
ElectionCardNo,
FamilyListNo,
recstatus,
HealthCheckUp,
WorkBook
)
values(
@Year,
@Month,
@NewEmpID,
@ECardNo,
@SerialCard,
@EmployeeNameKH ,
@EmployeeNameEng,
@Sex ,
@DOB ,
@Pob ,
@MaritalStatus ,
@Spouse ,
@Child ,
@Address ,
@NationalityID ,
@CityID,
@TeamID,
@GroupID,
@PositionID,
@Tel,
@Email,
@SSN,
@DriverLicense ,
@FingerPrint ,
@Salary,
@DateJoin ,
@DateResigned ,
@Memo ,
@Photo,
@PhotoPath,
@PaymentType,
getdate(),
@Currency,
@oldAnlUsed,
@BackupEmpID,
@ElectionCardNo,
@FamilyListNo,
@recstatus,
@HealthCheckUp,
@WorkBook
)
--SET @NewEmpID= @@IDENTITY
--set @NewEmpID= funGenerateNewID;

