﻿/****** Object:  Table [dbo].[FT33NAT]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FT33NAT](
	[FT33KY] [nvarchar](20) NOT NULL,
	[LT33901MSG] [nvarchar](20) NOT NULL,
	[FT33VAL] [nvarchar](250) NULL,
	[FT33MT] [decimal](23, 8) NULL,
	[FT33ORDRE] [nvarchar](3) NULL,
	[FT33ARGIMP] [nvarchar](20) NULL,
	[FT33LIB] [nvarchar](60) NULL,
	[FT33MODIF] [char](1) NOT NULL,
	[FT33ACTIF] [char](1) NOT NULL,
	[FT33FILTRE1] [nvarchar](250) NULL,
	[FT33FILTRE2] [nvarchar](250) NULL,
 CONSTRAINT [PK_FT33NAT] PRIMARY KEY CLUSTERED 
(
	[FT33KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
