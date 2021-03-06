USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_Employee_Add]    Script Date: 05/18/2019 14:10:15 ******/
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
@TeamID INT,
@GroupID INT,
@PositionID INT,
@Tel varchar(250),
@Email varchar(50),
@SSN VARCHAR(20),
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
EmployeeNameEng ,
EmployeeNameKH,
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
recstatus
)
values(
@Year,
@Month,
@NewEmpID,
@ECardNo,
@SerialCard,
@LatinName ,
@OtherName,
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
@recstatus
)
--SET @NewEmpID= @@IDENTITY
--set @NewEmpID= funGenerateNewID;

