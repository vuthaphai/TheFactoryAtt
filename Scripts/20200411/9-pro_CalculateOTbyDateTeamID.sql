USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[pro_CalculateOTbyDate]    Script Date: 08/22/2019 02:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO







Create     PROCEDURE [dbo].[pro_CalculateOTbyDateTeamID] (@systemdate DateTime,@TeamID Bigint)
AS
DECLARE @EmployeeID bigint ,@Status char(1)

DECLARE @F_IN int,@F_OUT int,@S_IN int,@S_OUT int,@TimeScan Varchar(4000)
DECLARE @T1 int,@T2 int,@T3 int,@T4 int
DECLARE @OT1Start int,  @OT1Stop int, @OT2Start int,@OT2Stop int,@OT3Start int ,@OT3Stop int
DECLARE @BfIn int, @AfterOut int

-- 
DECLARE @OT1  FLOAT ,@OT2 FLOAT,@OT3 FLOAT


DECLARE  vCtlList_cursor  CURSOR FOR 
SELECT 	 EmployeeID,BeforeWorkingAllowed,AfterWorkingAllowed,
	dbo.func_BreakToMinute(FirstIn) FirstIn,
	dbo.func_BreakToMinute(FirstOut) FirstOut,
	dbo.func_BreakToMinute(SecondIn) SecondIn,
	dbo.func_BreakToMinute(SecondOut) SecondOut,
	TimeScan,
	dbo.func_BreakToMinute(substring(TimeScan,1,5)) as T1,
	dbo.func_BreakToMinute(substring(TimeScan,7,5)) as T2,
	dbo.func_BreakToMinute(substring(TimeScan,13,5)) as T3,
	dbo.func_BreakToMinute(	substring(TimeScan,19,5)) as T4,
	dbo.func_BreakToMinute(	OT1Start) as OT1Start,
	dbo.func_BreakToMinute(OT1Stop) as OT1Stop,
	dbo.func_BreakToMinute(	OT2Start) as OT2Start,
	dbo.func_BreakToMinute(	OT2Stop) as OT2Stop,
	dbo.func_BreakToMinute(	OTSStart) as OTSStart,
	dbo.func_BreakToMinute(	OTSStop) as OTSStop
FROM Vew_ControlList WHERE SystemDate= @SystemDate and TeamID=@TeamID ORDER BY NumberOfTimer 

OPEN vCtlList_cursor
     FETCH NEXT FROM vCtlList_cursor
     INTO 
   	 @EmployeeID,@BfIn,@AfterOut,
	@F_IN,@F_OUT,@S_IN,@S_OUT,@TimeScan,
	@T1,@T2,@T3,@T4,
	@OT1Start,@OT1Stop,@OT2Start,@OT2Stop,@OT3Start,@OT3Stop
WHILE @@FETCH_STATUS = 0
 BEGIN 	
	/*============Calculate OT=============*/
	SET @OT1=0
	SET @OT2=0
	SET @OT3=0
	DECLARE @StrOT AS VARCHAR(20)
	SET @StrOT=dbo.Func_GetAllOTHours(@OT1Start,@OT1Stop,@OT2Start,@OT2Stop,@OT3Start,@OT3Stop, @BfIn,@AfterOut,@TimeScan,@SystemDate,@EmployeeID)
	-- @StrOT form will return "T112;T22.5;T35.5"
	DECLARE @ChrIndex as tinyint
	--OT1
	SET @ChrIndex=CHARINDEX(';',@StrOT,1)	
	SET @OT1=CAST(RIGHT( LEFT(@StrOT,@ChrIndex-1),  LEN(LEFT(@StrOT,@ChrIndex-1)) -2) AS float)
	--OT2
	DECLARE @Start TinyInt
	SET @Start=@ChrIndex+3 -- minus string ';T2'
	SET @ChrIndex=CHARINDEX(';',@StrOT,@ChrIndex+1)
	SET @OT2=CAST(SUBSTRING(@StrOT,@Start,@ChrIndex-@Start) AS float)
	if @OT2>2
	begin
		set @OT2=@OT2-0.5
	end
	--OT3	
	SET @OT3=CAST(RIGHT(@StrOT,LEN(@StrOT)-(@ChrIndex+2)) AS float)	
	/*==========Find Error Data===============*/
	SET @Status=dbo.Func_GetErrorStatus(@T1,@T2,@T3,@T4,@F_IN,@F_OUT,@S_IN,@S_OUT,@BfIn,@AfterOut)
	/*=====UPDATE OT and Status ==============*/
	UPDATE tblDailyRecord SET 
		Status=@status, 
		OT1=@OT1, 
		OT2=@OT2,
		OTS=@OT3		
	WHERE EmployeeID=@EmployeeID And SystemDate=@SystemDate	
	/*=======UPDATE Cut Prim==================*/
	IF not (@timeScan is null OR @timeScan='') UPDATE tblDailyRecord SET CutAttendanceAmount=1  WHERE EmployeeID=@EmployeeID And SystemDate=@SystemDate	
	DECLARE @I as int --l
	DECLARE @BT3 int
	SET @BT3=@T3   -- Backup of T3
	SET @I=0 		-- @I=1 To know that @T1 come late, @I=2 @T3 come late
	WHILE @I<2
	BEGIN 
		SET @I=@I+1
		IF @I=1 SET @T3=@S_IN -- Control @T1 come late or not
		IF @I=2 
			BEGIN 
				SET @T1=@F_IN -- Control @T2 come late or not
				SET @T3=@BT3
			END
	
   		DECLARE @PrimReceive  bit
		SELECT @PrimReceive=dbo.Func_CutPrim(@T1,@T3,@F_IN,@S_IN,@AfterOut)
		IF @PrimReceive = 0 -- attendance allowance can cut
		BEGIN				
			DECLARE @NumTime as tinyint,@BackupEmpID bigint				
			SELECT @NumTime=ISNULL(COUNT(SystemDate),0) From tblCutPrim WHERE year(SystemDate)=Year(@SystemDate) and Month(SystemDate)= Month(@SystemDate) and EmployeeID=@EmployeeID
			IF @NumTime>=2  		
			Begin
				SET @PrimReceive=0						
				UPDATE tblDailyRecord SET CutAttendanceAmount=@PrimReceive  WHERE EmployeeID=@EmployeeID And SystemDate=@SystemDate	
			end
			-- Insert number of cut prim
			--<<VP
			--SELECT @BackupEmpID=BackupEmpID from tblDailyrecord WHERE SystemDate=@SystemDate and EmployeeID=@EmployeeID
			--EXEC Pro_InsertCutPrim @EmployeeID,@BackupEmpID,@SystemDate
			set @BackupEmpID =@EmployeeID
			EXEC Pro_InsertCutPrim @EmployeeID,@BackupEmpID,@SystemDate
			-->>VP
		END	
	END -- end While
	

 FETCH NEXT FROM vCtlList_cursor
 INTO    	 
	@EmployeeID,@BfIn,@AfterOut,
	@F_IN,@F_OUT,@S_IN,@S_OUT,@TimeScan,
	@T1,@T2,@T3,@T4,
	@OT1Start,@OT1Stop,@OT2Start,@OT2Stop,@OT3Start,@OT3Stop
 END 
CLOSE vCtlList_cursor
DEALLOCATE  vCtlList_cursor

