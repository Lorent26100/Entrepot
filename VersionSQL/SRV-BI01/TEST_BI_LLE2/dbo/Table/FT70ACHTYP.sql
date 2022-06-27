﻿/****** Object:  Table [dbo].[FT70ACHTYP]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FT70ACHTYP](
	[FT70KY] [nvarchar](20) NOT NULL,
	[LT70901MSG] [nvarchar](20) NOT NULL,
	[FT70VAL] [nvarchar](250) NULL,
	[FT70MT] [decimal](23, 8) NULL,
	[FT70ORDRE] [nvarchar](3) NULL,
	[FT70ARGIMP] [nvarchar](20) NULL,
	[FT70LIB] [nvarchar](60) NULL,
	[FT70MODIF] [char](1) NOT NULL,
	[FT70ACTIF] [char](1) NOT NULL,
 CONSTRAINT [PK_FT70ACHTYP] PRIMARY KEY CLUSTERED 
(
	[FT70KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
