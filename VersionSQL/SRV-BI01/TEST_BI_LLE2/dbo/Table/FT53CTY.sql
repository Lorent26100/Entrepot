﻿/****** Object:  Table [dbo].[FT53CTY]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FT53CTY](
	[FT53KY] [nvarchar](20) NOT NULL,
	[LT53901MSG] [nvarchar](20) NOT NULL,
	[FT53VAL] [nvarchar](250) NULL,
	[FT53MT] [decimal](23, 8) NULL,
	[FT53ORDRE] [nvarchar](3) NULL,
	[FT53ARGIMP] [nvarchar](20) NULL,
	[FT53LIB] [nvarchar](60) NULL,
	[FT53MODIF] [char](1) NOT NULL,
	[FT53ACTIF] [char](1) NOT NULL,
 CONSTRAINT [PK_FT53CTY] PRIMARY KEY CLUSTERED 
(
	[FT53KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]