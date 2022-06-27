﻿/****** Object:  Table [dbo].[BI_LOG]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[BI_LOG](
	[BI_LOG_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[BI_LOG_DATETIME] [datetime2](7) NOT NULL,
	[BI_LOG_TYPE] [nchar](10) NULL,
	[BI_LOG_LIBELLE] [nvarchar](max) NULL,
	[BI_LOG_TRAITEMENT] [nchar](50) NULL,
 CONSTRAINT [PK_BI_LOG_1] PRIMARY KEY CLUSTERED 
(
	[BI_LOG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
