USE [dbUpgrateSoft]
GO
/****** Object:  StoredProcedure [dbo].[Pro_GetYearMonthWillOpen]    Script Date: 05/22/2019 13:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   procedure [dbo].[Pro_GetLastPayrollRunNum](
 @RunNum varchar(6) output
 
)as

--SELECT @Year=MAX(vpYEAR),@Month=MAX(vpMonth) 
--FROM TblValidatePayroll
--WHERE vpYear=(SELECT MAX(vpYear) FROM TblValidatePayroll)

SELECT @RunNum=MAX(vp.run_num) 
FROM TblValidatePayroll vp
WHERE vpYear=(SELECT MAX(vpYear) FROM TblValidatePayroll)



--IF @Month=12 
-- begin
--   set @Year=cast(@Year as int) + 1
--   set @Month=1
-- end
--else if @month is null
-- begin
--	set @Year= '0'
--	set @month=0
-- end
--else
-- begin
--    set @Month= @Month+1
-- end




