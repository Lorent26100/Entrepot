﻿/****** Object:  Table [dbo].[BI_DIM_JOIN_BI_DIM_JOIN_FIELDS]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[BI_DIM_JOIN_BI_DIM_JOIN_FIELDS](
	[BI_DIM_JOIN_BI_DIM_JOIN_FIELDS_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[BI_DIM_JOIN_BI_DIM_JOIN_FIELDS_BI_DIM_JOIN_ID] [bigint] NOT NULL,
	[BI_DIM_JOIN_BI_DIM_JOIN_FIELDS_BI_DIM_JOIN_FIELDS_ID] [bigint] NOT NULL,
 CONSTRAINT [BI_DIM_JOIN_BI_DIM_JOIN_FIELDS_1] PRIMARY KEY CLUSTERED 
(
	[BI_DIM_JOIN_BI_DIM_JOIN_FIELDS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
