USE [dbNasmi]
GO
/****** Object:  StoredProcedure [dbo].[Pro_Position_Update]    Script Date: 05/18/2019 19:43:06 ******/
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


