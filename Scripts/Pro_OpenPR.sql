USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_OpenPR]    Script Date: 07/25/2020 10:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO





alter         PROCEDURE [dbo].[Pro_OpenPR]--(
--@RunNun varchar(6)

--)
AS
begin
--exec @GetShiftID=dbo.funGenerateNewID;
exec Pro_Shift_BK_Add;
exec Pro_Position_BK_Add;
exec Pro_Line_BK_Add;
exec Pro_Group_BK_Add;
exec Pro_Team_BK_Add;
exec Pro_Employee_BK_Add;




end



