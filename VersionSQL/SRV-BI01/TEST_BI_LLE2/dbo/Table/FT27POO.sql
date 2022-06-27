﻿/****** Object:  Table [dbo].[FT27POO]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FT27POO](
	[FT27KY] [nvarchar](20) NOT NULL,
	[LT27901MSG] [nvarchar](20) NOT NULL,
	[FT27VAL] [nvarchar](250) NULL,
	[FT27MT] [decimal](23, 8) NULL,
	[FT27ORDRE] [nvarchar](3) NULL,
	[FT27ARGIMP] [nvarchar](20) NULL,
	[FT27LIB] [nvarchar](60) NULL,
	[FT27MODIF] [char](1) NOT NULL,
	[FT27ACTIF] [char](1) NOT NULL,
 CONSTRAINT [PK_FT27POO] PRIMARY KEY CLUSTERED 
(
	[FT27KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
