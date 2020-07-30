USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Position_BK_Add]    Script Date: 07/25/2020 11:11:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO





create         PROCEDURE [dbo].[Pro_Position_BK_Add]--(
--@RunNun varchar(6)

--)
AS
begin
--exec @GetShiftID=dbo.funGenerateNewID;
declare @RunNum varchar(6);
declare @y char(4),@m int,@_run_num varchar(6);

exec @RunNum=dbo.funGetLastPayrollRunNum;
set @y=substring(@RunNum,1,4);
set @m=substring(@RunNum,5,2);
set @_run_num=@RunNum;

delete from TblPosition_bk where Run_Num=@RunNum;

insert into TblPosition_bk 
select s.*,@_run_num
from TblPosition s ;

update TblPosition_bk 
set  [Year]=@y
    ,[Month]=@m
where Run_Num=@_run_num;




end



