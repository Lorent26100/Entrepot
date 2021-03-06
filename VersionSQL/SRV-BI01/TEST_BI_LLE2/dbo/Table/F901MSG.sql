/****** Object:  Table [dbo].[F901MSG]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[F901MSG](
	[F901NUM] [nvarchar](20) NOT NULL,
	[F901LNG] [nvarchar](3) NOT NULL,
	[F901MSG] [nvarchar](600) NULL,
	[F901ABR] [nvarchar](40) NULL,
	[F901TAB] [nvarchar](20) NULL,
	[F901CHP] [nvarchar](30) NULL,
	[F901ACTIF] [char](1) NOT NULL,
	[K901TO2QUALTRAD] [nvarchar](20) NULL,
	[F901TI8ORI] [nvarchar](20) NULL,
 CONSTRAINT [PK_F901MSG] PRIMARY KEY CLUSTERED 
(
	[F901NUM] ASC,
	[F901LNG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]
