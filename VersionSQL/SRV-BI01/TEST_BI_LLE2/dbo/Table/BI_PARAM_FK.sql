/****** Object:  Table [dbo].[BI_PARAM_FK]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[BI_PARAM_FK](
	[BPFK_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[BPFK_INDEX_DELETION] [nvarchar](max) NULL,
	[BPFK_INDEX_CREATION] [nvarchar](max) NULL,
 CONSTRAINT [PK_BI_PARAM_FK] PRIMARY KEY CLUSTERED 
(
	[BPFK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
