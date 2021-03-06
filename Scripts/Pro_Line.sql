USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Line_Add]    Script Date: 07/25/2020 11:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO








ALTER         PROCEDURE [dbo].[Pro_Line_Add](
@Year char(4),
@Month tinyint,
@LineLabel VARCHAR(50),
@LineName nvarchar(250),
@LineNameOther nvarchar(250),
@Formula varchar(500),
@Status  tinyint,
@Sign char(1),
@Currency nvarchar(10),
@DisplayQty bit,
@DisplayUnitprice bit,
@Hidden bit,
@BackupLineID bigint,
@FormatNumber varchar(50),
@CutNumberAfterDecimal bit,
@RoundRiel bit,
@GetLineID bigint output

)
AS
begin

exec @GetLineID=dbo.funGenerateNewID;

INSERT INTO TblLine
(
[Year],
[Month],
 LINEID,
[Line Label],
[Line Name],
[Line Name Other],
Formula,
Status,
[Sign],
Currency,
[Display Qty],
[Display Unit price],
Hidden ,
BackupLineID,
Formatnumber,
CutNumberAfterDecimal,
RoundRiel 
)values(
@Year,
@Month,
@GetLineID,
@LineLabel,
@LineName,
@LineNameOther,
@Formula,
@Status,
@Sign,
@Currency,
@DisplayQty,
@DisplayUnitPrice,
@Hidden,
@BackupLineID,
@FormatNumber,
@CutNumberAfterDecimal,
@RoundRiel
)
_LBLFINISH:	
end

--set @GetLineID=@@IDENTITY

