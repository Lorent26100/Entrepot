﻿/****** Object:  Table [dbo].[F033SECT]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[F033SECT](
	[F033KY] [nvarchar](20) NOT NULL,
	[F033LIB] [nvarchar](40) NULL,
	[F033DIRECT] [nvarchar](20) NULL,
	[K033T88NAT] [nvarchar](20) NOT NULL,
	[F033ACTIF] [char](1) NOT NULL,
	[K033030AGE] [nvarchar](20) NULL,
	[F033DTDEP] [datetime] NULL,
	[F033DTFIN] [datetime] NULL,
	[K033001SOC] [nvarchar](20) NULL,
	[F033FILTRE1] [nvarchar](250) NULL,
	[F033FILTRE2] [nvarchar](250) NULL,
	[K033T88NAT2] [nvarchar](20) NULL,
 CONSTRAINT [PK_F033SECT] PRIMARY KEY CLUSTERED 
(
	[F033KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [FK_A033T88NAT] ON [dbo].[F033SECT]
(
	[K033T88NAT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I_FK_A033001SOC] ON [dbo].[F033SECT]
(
	[K033001SOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I_FK_A033030AGE] ON [dbo].[F033SECT]
(
	[K033030AGE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
ALTER TABLE [dbo].[F033SECT] ADD  CONSTRAINT [DF_F033SECT_F033ACTIF]  DEFAULT ('1') FOR [F033ACTIF]
ALTER TABLE [dbo].[F033SECT]  WITH CHECK ADD  CONSTRAINT [CKC_F033ACTIF_F033SECT] CHECK  (([F033ACTIF]>='1' AND [F033ACTIF]<='2'))
ALTER TABLE [dbo].[F033SECT] CHECK CONSTRAINT [CKC_F033ACTIF_F033SECT]
ALTER TABLE [dbo].[F033SECT]  WITH CHECK ADD  CONSTRAINT [CV_F033SECT_F033ACTIF] CHECK  (([F033ACTIF]<>''))
ALTER TABLE [dbo].[F033SECT] CHECK CONSTRAINT [CV_F033SECT_F033ACTIF]
ALTER TABLE [dbo].[F033SECT]  WITH CHECK ADD  CONSTRAINT [CV_F033SECT_F033KY] CHECK  (([F033KY]<>''))
ALTER TABLE [dbo].[F033SECT] CHECK CONSTRAINT [CV_F033SECT_F033KY]
