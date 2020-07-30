USE [dbUpgrateSoft]
GO

/****** Object:  Table [dbo].[tfield_descriptions]    Script Date: 05/19/2019 15:24:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tfield_descriptions](
	[fld_nm] [varchar](30) NOT NULL,
	[fld_nm_desc] [varchar](60) NOT NULL,
	[rec_status] [varchar](1) NOT NULL,
	[sys_ind] [varchar](1) NULL,
	[dflt_valu] [varchar](10) NULL,
	[app_cd] [varchar](3) NULL,
 CONSTRAINT [PK_tfield_descriptions] PRIMARY KEY CLUSTERED 
(
	[fld_nm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


