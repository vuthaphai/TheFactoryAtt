USE dbYingYi02
GO
/****** Object:  StoredProcedure [dbo].[Pro_Askpermission_NewGetInfo]    Script Date: 08/22/2019 04:20:09 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

create   procedure [dbo].[Pro_CheckAskpermission]
(
@FromDate as date,
@ToDate as date,
@EmpID as Bigint
)as

select * from Vew_AskPermission where LeaveDate  between  @Fromdate and @ToDate and  EmpID=@EmpID