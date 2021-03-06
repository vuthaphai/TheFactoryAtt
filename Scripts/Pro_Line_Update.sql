USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Line_Update]    Script Date: 07/25/2020 11:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO







ALTER         PROCEDURE [dbo].[Pro_Line_Update](
@LINEID bigint,
@LineLabel VARCHAR(50),
@LineName nvarchar(250),
@LineNameOther nvarchar(250),
@Formula varchar(500),
@Status tinyint,
@Sign char(1),
@Currency nvarchar(10),
@DisplayQty bit,
@DisplayUnitprice bit,
@Hidden bit,
@FormatNumber varchar(50),
@CutNumberAfterDecimal bit,
@RoundRiel bit
)
AS
BEGIN
declare @Year char(4) ,@Month tinyint 
---Check Contraint on Line Label
/*
--1. 
SELECT @Year=[Year],@Month=[Month] 
FROM TblLine where LineID =@LineID
--2.
if @Year is null 
 begin
 if exists( select [Line Label] From TblLine where [Line Label]=@LineLabel and  [Year] is null and LineID<>@LineID)
   begin
     RAISERROR('Line Label already exist.',16,1)
      GOTO _LBLFINISH	
   end
 end

else
 begin
	 if exists(select [Line Label] From TblLine where [Line Label]=@LineLabel and  [Year]=@Year and LineID<>@LineID)
	   begin
	     RAISERROR('Line Label already exist.',16,1)
	      GOTO _LBLFINISH	
   	   end
 end
*/



update TblLine set 
[Line Label]=@LineLabel,
[Line Name]=@LineName,
[Line Name Other]=@LineNameOther,
Formula=@Formula,
Status=@Status,
[Sign]=@Sign,
Currency=@Currency,
[Display Qty]=@DisplayQty,
[Display Unit price]=@DisplayUnitPrice,
Hidden = @Hidden,
FormatNumber=@FormatNumber,
CutNumberAfterDecimal=@CutNumberAfterDecimal,
RoundRiel=@RoundRiel
where  LINEID=@LINEID
_LBLFINISH:
END

