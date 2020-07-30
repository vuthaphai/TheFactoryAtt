USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Position_Update]    Script Date: 07/25/2020 11:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER    PROCEDURE [dbo].[Pro_Position_Update]
(
@PosID bigint,
@NativeName nvarchar(150),
@ForeignName nvarchar(150),
@Memo nvarchar(800)
)AS
UPDATE TblPosition set
PositionNameother=@NativeName,
PositionNameEng=@ForeignName,
Memo=@Memo
Where PositionID=@PosID


