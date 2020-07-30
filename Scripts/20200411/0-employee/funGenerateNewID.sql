USE dbYingYi02
GO

/****** Object:  UserDefinedFunction [dbo].[funGenerateNewID]    Script Date: 07/11/2020 12:07:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
create FUNCTION [dbo].[funGenerateNewID]
(
	-- Add the parameters for the function here
	--<@Param1, sysname, @p1> <Data_Type_For_Param1, , int>
)
RETURNS bigint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @_id bigint;

	-- Add the T-SQL statements to compute the return value here
	select @_id= replace(convert(varchar, getdate(),111),'/','') + replace(convert(varchar, getdate(),114),':','') ;


	-- Return the result of the function
	RETURN @_id

END

GO


