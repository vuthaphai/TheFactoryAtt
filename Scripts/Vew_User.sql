USE dbYingYi02
GO

/****** Object:  View [dbo].[Vew_User]    Script Date: 07/11/2020 11:52:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[Vew_User]
AS
SELECT ID, [User Name], [Full name], ISNULL(Description, N'') AS Description, ISNULL(Passwords, N'') AS Passwords, Disable, Status, WarningContract, 
               ISNULL(SalaryFrom, 0) AS SalaryFrom, ISNULL(SalaryTo, 0) AS SalaryTo, DataTrueFalse
FROM  dbo.TblUser

GO


