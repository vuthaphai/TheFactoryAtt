USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Position_Add]    Script Date: 07/25/2020 11:37:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






ALTER       PROCEDURE [dbo].[Pro_Position_Add]
(
@Year char(4),
@Month tinyint,
@NativeName nvarchar(150),
@ForeignName nvarchar(150),
@Memo nvarchar(800),
@BackupPOSID bigint,
@GetNewPosID bigint OUTPUT
)AS

exec @GetNewPosID=dbo.funGenerateNewID;

INSERT INTO TblPosition
(
PositionID,
[Year],
[Month],
PositionNameother,
PositionNameEng,
Memo,
BackupPOSID
)
VALUES(
@GetNewPosID,
@Year,
@Month,
@NativeName,
@ForeignName,
@Memo,
@BackupPosID
)
-----------------------------------
--SET @GetNewPosID = @@IDENTITY




