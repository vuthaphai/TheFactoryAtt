USE [dbUpgrateSoft]
GO
/****** Object:  StoredProcedure [dbo].[Pro_Line_Delete]    Script Date: 05/20/2019 16:32:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[Pro_Line_Delete](
@LINEID bigint
)
AS
DELETE FROM TblLine WHERE LINEID= @LINEID