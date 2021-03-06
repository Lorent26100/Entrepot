/****** Object:  Table [dbo].[FTE8FAMILLE]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[FTE8FAMILLE](
	[FTE8KY] [nvarchar](20) NOT NULL,
	[LTE8901MSG] [nvarchar](20) NOT NULL,
	[FTE8VAL] [nvarchar](250) NULL,
	[FTE8MT] [decimal](23, 8) NULL,
	[FTE8ORDRE] [nvarchar](3) NULL,
	[FTE8ARGIMP] [nvarchar](20) NULL,
	[FTE8LIB] [nvarchar](60) NULL,
	[FTE8MODIF] [char](1) NOT NULL,
	[FTE8ACTIF] [char](1) NOT NULL,
	[KTE8TE8PERE] [nvarchar](20) NULL,
	[FTE8NMFAM] [int] NULL,
	[FTE8FILTRE1] [nvarchar](250) NULL,
	[FTE8FILTRE2] [nvarchar](250) NULL,
 CONSTRAINT [PK_FTE8FAMILLE] PRIMARY KEY CLUSTERED 
(
	[FTE8KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
