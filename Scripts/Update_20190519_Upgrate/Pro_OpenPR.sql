USE [dbUpgrateSoft]
GO
/****** Object:  StoredProcedure [dbo].[Pro_Position_BK_Add]    Script Date: 05/24/2019 21:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO





create         PROCEDURE [dbo].[Pro_OpenPR]--(
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



