USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Askpermission_NewGetInfo]    Script Date: 08/22/2019 03:14:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER   procedure [dbo].[Pro_Askpermission_NewGetInfo]
(
@FromDate as datetime,
@ToDate as datetime,
@PerType as int
)as
print @perType
if @PerType>0 
	select * from Vew_AskPermission where LeaveDate  between  @Fromdate and @ToDate and  AskPermissionTypeID=@PerType
else
	select * from Vew_AskPermission where LeaveDate  between  @Fromdate and @ToDate