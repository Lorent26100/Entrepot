/****** Object:  Table [dbo].[FT25CAT]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FT25CAT](
	[FT25KY] [nvarchar](20) NOT NULL,
	[LT25901MSG] [nvarchar](20) NOT NULL,
	[FT25VAL] [nvarchar](250) NULL,
	[FT25MT] [decimal](23, 8) NULL,
	[FT25ORDRE] [nvarchar](3) NULL,
	[FT25ARGIMP] [nvarchar](20) NULL,
	[FT25LIB] [nvarchar](60) NULL,
	[FT25MODIF] [char](1) NOT NULL,
	[FT25ACTIF] [char](1) NOT NULL,
	[KT25T07TYP] [nvarchar](20) NULL,
	[KT25TB1ETAT] [nvarchar](20) NULL,
	[FT25FILTRE1] [nvarchar](60) NULL,
	[FT25FILTRE2] [nvarchar](60) NULL,
 CONSTRAINT [PK_FT25CAT] PRIMARY KEY CLUSTERED 
(
	[FT25KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
