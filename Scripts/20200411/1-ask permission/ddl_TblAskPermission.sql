USE dbYingYi02
GO

/****** Object:  Table [dbo].[TblAskPermission]    Script Date: 08/18/2019 23:49:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
drop table [TblAskPermission]
CREATE TABLE [dbo].[TblAskPermission](
	[askID] [bigint] NOT NULL,
	[EmpID] [bigint] NULL,
	[TransactionDate] [smalldatetime] NOT NULL,
	[AskPermissionTypeID] [int] NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[LeaveDate] [datetime] NOT NULL,
	[LeaveHours] [numeric](18, 2) NULL,
	[UserID] [bigint] NULL,
 CONSTRAINT [PK_TblAskPermission] PRIMARY KEY CLUSTERED 
(
	[askID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


