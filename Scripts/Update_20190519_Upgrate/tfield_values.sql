USE [dbUpgrateSoft]
GO

/****** Object:  Table [dbo].[tfield_values]    Script Date: 05/19/2019 15:25:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tfield_values](
	[fld_nm] [varchar](30) NOT NULL,
	[fld_valu] [varchar](20) NOT NULL,
	[fld_valu_desc] [varchar](500) NOT NULL,
	[rec_status] [varchar](1) NULL,
	[fld_valu_desc_eng] [varchar](200) NULL,
	[fld_lkup_valu] [varchar](30) NULL,
	[app_cd] [varchar](3) NULL,
	[seq_num] [numeric](3, 0) NULL,
 CONSTRAINT [PK_tfield_values] PRIMARY KEY CLUSTERED 
(
	[fld_nm] ASC,
	[fld_valu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


