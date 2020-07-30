USE [dbUpgrateSoft]
GO

/****** Object:  Table [dbo].[tcontrol_parameters]    Script Date: 05/19/2019 15:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tcontrol_parameters](
	[terr_cd] [varchar](1) NOT NULL,
	[status_cd] [varchar](2) NOT NULL,
	[parm_typ] [varchar](30) NOT NULL,
	[parm_valu] [varchar](50) NOT NULL,
	[rec_status] [varchar](1) NOT NULL,
	[parm_desc] [varchar](60) NULL,
	[glob_ind] [varchar](1) NULL,
	[data_typ] [varchar](10) NULL,
	[app_cd] [varchar](3) NULL,
	[crcy_code] [varchar](2) NOT NULL,
 CONSTRAINT [PK_tcontrol_parameters] PRIMARY KEY CLUSTERED 
(
	[terr_cd] ASC,
	[status_cd] ASC,
	[parm_typ] ASC,
	[parm_valu] ASC,
	[crcy_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


