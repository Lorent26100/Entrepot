﻿/****** Object:  Table [dbo].[FT31TYP]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FT31TYP](
	[FT31KY] [nvarchar](20) NOT NULL,
	[LT31901MSG] [nvarchar](20) NOT NULL,
	[FT31VAL] [nvarchar](250) NULL,
	[FT31MT] [decimal](23, 8) NULL,
	[FT31ORDRE] [nvarchar](3) NULL,
	[FT31ARGIMP] [nvarchar](20) NULL,
	[FT31LIB] [nvarchar](60) NULL,
	[FT31MODIF] [char](1) NOT NULL,
	[FT31ACTIF] [char](1) NOT NULL,
	[FT31FILTRE1] [nvarchar](250) NULL,
	[FT31FILTRE2] [nvarchar](250) NULL,
 CONSTRAINT [PK_FT31TYP] PRIMARY KEY CLUSTERED 
(
	[FT31KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
