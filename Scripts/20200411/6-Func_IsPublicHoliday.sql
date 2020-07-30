USE dbYingYi02
GO
/****** Object:  UserDefinedFunction [dbo].[Func_IsPublicHoliday]    Script Date: 11/22/2019 22:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create  function [dbo].[Func_IsPublicHoliday](
@HolDate datetime
) returns  varchar
as
begin
declare @cnt int,@yn varchar(1)

select @cnt= COUNT(holid) 
from TblHoliday
where @HolDate between StartDate and EndDate

if @cnt>0 
	set @yn='Y'
else
	set @yn='N'
	
return @yn

end





