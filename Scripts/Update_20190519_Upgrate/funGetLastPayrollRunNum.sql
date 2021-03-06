USE [dbUpgrateSoft]
GO
/****** Object:  UserDefinedFunction [dbo].[funGetLastPayrollRunNum]    Script Date: 05/22/2019 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
ALTER FUNCTION [dbo].[funGetLastPayrollRunNum]
(
	-- Add the parameters for the function here
	--<@Param1, sysname, @p1> <Data_Type_For_Param1, , int>
)
RETURNS varchar(6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @_runNum varchar(6),@_y int,@_m int;

	-- Add the T-SQL statements to compute the return value here
	select  @_runNum=MAX(run_num),@_y=MAX(vpyear),@_m=MAX(vpmonth)
	FROM TblValidatePayroll vp ;


	-- Return the result of the function
	RETURN @_runNum

END
