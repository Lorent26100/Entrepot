﻿/****** Object:  Table [dbo].[F05ZTYPE]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[F05ZTYPE](
	[F05ZKY] [nvarchar](20) NOT NULL,
	[K05Z050TIE] [nvarchar](20) NOT NULL,
	[K05ZT05TYP] [nvarchar](20) NOT NULL,
	[K05ZT05STYP] [nvarchar](20) NULL,
	[K05Z001SOC] [nvarchar](20) NULL,
 CONSTRAINT [PK_F05ZTYPE] PRIMARY KEY CLUSTERED 
(
	[F05ZKY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[F05ZTYPE]  WITH CHECK ADD  CONSTRAINT [CV_F05ZTYPE_F05ZKY] CHECK  (([F05ZKY]<>''))
ALTER TABLE [dbo].[F05ZTYPE] CHECK CONSTRAINT [CV_F05ZTYPE_F05ZKY]
