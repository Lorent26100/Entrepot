﻿/****** Object:  Table [dbo].[F102CD]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[F102CD](
	[F102100KY] [nvarchar](20) NOT NULL,
	[F102JRPLA] [decimal](23, 8) NULL,
	[F102TX] [decimal](23, 8) NULL,
	[F102ORDRE] [nvarchar](3) NULL,
	[K102T31TYP] [nvarchar](20) NOT NULL,
	[K102T30FCT] [nvarchar](20) NOT NULL,
	[K102T29CAL] [nvarchar](20) NOT NULL,
	[K102TB3AFFQT] [nvarchar](20) NULL,
 CONSTRAINT [PK_F102CD] PRIMARY KEY CLUSTERED 
(
	[F102100KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
