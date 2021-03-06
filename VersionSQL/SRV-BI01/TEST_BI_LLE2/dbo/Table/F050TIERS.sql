/****** Object:  Table [dbo].[F050TIERS]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[F050TIERS](
	[F050KY] [nvarchar](20) NOT NULL,
	[K050001SOC] [nvarchar](20) NULL,
	[F050DIRECT] [nvarchar](40) NULL,
	[F050CODE] [nvarchar](150) NULL,
	[F050NOM] [nvarchar](150) NULL,
	[F050PRENOM] [nvarchar](40) NULL,
	[K050020ADR] [nvarchar](20) NOT NULL,
	[F050CDP] [nvarchar](20) NULL,
	[F050STATIS] [nvarchar](40) NULL,
	[K050T15TIT] [nvarchar](20) NOT NULL,
	[K050110TAR] [nvarchar](20) NULL,
	[K050T56TVAD] [nvarchar](20) NULL,
	[K050T52DEV] [nvarchar](20) NOT NULL,
	[F050CARTE] [nvarchar](20) NULL,
	[F050CARTEFIN] [datetime] NULL,
	[F050PLAFOND] [decimal](23, 8) NULL,
	[F050TXCOM1] [decimal](23, 8) NULL,
	[F050TXCOM2] [decimal](23, 8) NULL,
	[F050IATA] [nvarchar](10) NULL,
	[F050TVAI] [nvarchar](30) NULL,
	[F050APE] [nvarchar](10) NULL,
	[F050ACTIF] [char](1) NOT NULL,
	[F050TAXPRO] [char](1) NOT NULL,
	[T050050LANGUE] [nvarchar](20) NULL,
	[K050H18NUM] [int] NULL,
	[F050TXENCOURS] [decimal](23, 8) NULL,
	[F050STATIS2] [nvarchar](20) NULL,
	[K050030AGE] [nvarchar](20) NULL,
	[F050CENTREGRP] [char](1) NOT NULL,
	[F050MOISF] [char](1) NOT NULL,
	[K050110TARFRS] [nvarchar](20) NULL,
	[K050T28COM] [nvarchar](20) NULL,
	[F050PLA] [char](1) NOT NULL,
	[F050INDT] [datetime] NULL,
	[F050OUTDT] [datetime] NULL,
	[F050NBFAC] [int] NULL,
	[F050TXASS] [decimal](23, 8) NULL,
	[K050324REL] [nvarchar](20) NULL,
	[F050SSNM] [nvarchar](20) NULL,
	[F050FACUNI] [char](1) NOT NULL,
	[F050TXREM] [decimal](23, 8) NULL,
	[F050FRANCO] [decimal](23, 8) NULL,
	[K050T22COMM] [nvarchar](20) NULL,
	[F050JFILLE] [nvarchar](40) NULL,
	[F050REECH] [char](1) NOT NULL,
	[F050JRFAC] [nvarchar](15) NULL,
	[F050SIREN] [nvarchar](20) NULL,
	[K050TI8STATUT] [nvarchar](20) NULL,
	[K050TI8STATUT2] [nvarchar](20) NULL,
	[F050INDTP] [datetime] NULL,
	[F050DTCONTACT] [datetime] NULL,
	[F050OUTDTP] [datetime] NULL,
	[F050DUREE] [decimal](23, 8) NULL,
	[K050TI8PROV] [nvarchar](20) NULL,
	[K050050COM] [nvarchar](20) NULL,
	[F050CRITREL] [nvarchar](20) NULL,
	[K050TI8FAM] [nvarchar](20) NULL,
	[K050TI8SFAM] [nvarchar](20) NULL,
	[F050CDCRYPTO] [nvarchar](20) NULL,
	[K050T56TVADFRS] [nvarchar](20) NULL,
	[F050DTPOSITION] [datetime] NULL,
	[F050LATITUDE] [decimal](23, 8) NULL,
	[F050LONGITUDE] [decimal](23, 8) NULL,
	[F050JRPLA] [decimal](23, 8) NULL,
	[K050962EXPFAC] [nvarchar](20) NULL,
	[F050PWD] [nvarchar](150) NULL,
	[F050ANGLEMAPS] [int] NULL,
	[K050030AGECI] [nvarchar](20) NULL,
	[K050306ANACI] [nvarchar](20) NULL,
	[F050REFTIE1] [nvarchar](60) NULL,
	[F050REFTIE2] [nvarchar](60) NULL,
	[F050REFTIE3] [nvarchar](100) NULL,
	[F050REFTIE4] [nvarchar](60) NULL,
	[F050REFTIE5] [nvarchar](60) NULL,
	[F050REFTIE6] [nvarchar](60) NULL,
	[F050DETFACHORSPER] [char](1) NULL,
	[K050TE8FAMCPTA] [nvarchar](20) NULL,
	[K050T99FREQCRM] [nvarchar](20) NULL,
	[F050VALDEMAT] [nvarchar](60) NULL,
	[K050TN6REG] [nvarchar](20) NULL,
	[F050DTCLOCPTA] [datetime] NULL,
	[F050CTRLHR] [char](1) NULL,
	[F050RCS] [nvarchar](80) NULL,
	[K050TE8FAMFRS] [nvarchar](20) NULL,
	[K050TI8FAMFRS] [nvarchar](20) NULL,
	[F050DEMATCODESERVICE] [nvarchar](100) NULL,
	[F050DEMATENGAGE] [nvarchar](100) NULL,
	[F050NONDEMARCH] [nvarchar](1) NULL,
	[F050PRECISIONJOUR] [decimal](23, 8) NULL,
	[F050MODETVAADM] [char](1) NULL,
	[F050INFOTVAADM] [nvarchar](40) NULL,
 CONSTRAINT [PK_F050TIERS] PRIMARY KEY CLUSTERED 
(
	[F050KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [A001050TIE_FK2] ON [dbo].[F050TIERS]
(
	[K050001SOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [A050T15TIT_FK] ON [dbo].[F050TIERS]
(
	[K050T15TIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [A050T56TVAD_FK] ON [dbo].[F050TIERS]
(
	[K050T56TVAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [FK_A050110TAR] ON [dbo].[F050TIERS]
(
	[K050110TAR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [FK_A050T52DEV] ON [dbo].[F050TIERS]
(
	[K050T52DEV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I_FK_A050110TARFRS] ON [dbo].[F050TIERS]
(
	[K050110TARFRS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I_FK_A050324REL] ON [dbo].[F050TIERS]
(
	[K050324REL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I_FK_A050T22COMM] ON [dbo].[F050TIERS]
(
	[K050T22COMM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I_FK_A050T28COM] ON [dbo].[F050TIERS]
(
	[K050T28COM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I_FK_REF_K050030AGE] ON [dbo].[F050TIERS]
(
	[K050030AGE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I_K050020ADR] ON [dbo].[F050TIERS]
(
	[K050020ADR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I_K050050COM] ON [dbo].[F050TIERS]
(
	[K050050COM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I_K050962EXPFAC] ON [dbo].[F050TIERS]
(
	[K050962EXPFAC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [I_K050H18NUM] ON [dbo].[F050TIERS]
(
	[K050H18NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I050TIERS1] ON [dbo].[F050TIERS]
(
	[F050NOM] ASC,
	[F050PRENOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I050TIERS2] ON [dbo].[F050TIERS]
(
	[F050DIRECT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [I050TIERS3] ON [dbo].[F050TIERS]
(
	[F050CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF_F050TIERS_F050ACTIF]  DEFAULT ('1') FOR [F050ACTIF]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__F050T__529933DA]  DEFAULT ('1') FOR [F050TAXPRO]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__T0500__6324A15E]  DEFAULT ('001') FOR [T050050LANGUE]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__F050C__39C3646F]  DEFAULT ('2') FOR [F050CENTREGRP]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__F050M__481183C6]  DEFAULT ('2') FOR [F050MOISF]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__F050P__1E904B46]  DEFAULT ('2') FOR [F050PLA]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__F050N__207893B8]  DEFAULT ((1)) FOR [F050NBFAC]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__F050T__3D14D266]  DEFAULT ((0)) FOR [F050TXASS]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__F050F__1651A1AE]  DEFAULT ('1') FOR [F050FACUNI]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__F050R__4702F35D]  DEFAULT ('2') FOR [F050REECH]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF_F050TIERS_F050JRFAC]  DEFAULT ('11111111') FOR [F050JRFAC]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__F050D__7DFF1FAD]  DEFAULT ((0)) FOR [F050DUREE]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF__F050TIERS__F050J__17547599]  DEFAULT ((0)) FOR [F050JRPLA]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF_F050TIERS_F050CTRLHR]  DEFAULT ('2') FOR [F050CTRLHR]
ALTER TABLE [dbo].[F050TIERS] ADD  CONSTRAINT [DF_F050TIERS_F050NONDEMARCH]  DEFAULT ('2') FOR [F050NONDEMARCH]
ALTER TABLE [dbo].[F050TIERS] ADD  DEFAULT ((-1)) FOR [F050PRECISIONJOUR]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CKC_F050ACTIF_F050TIER] CHECK  (([F050ACTIF]>='1' AND [F050ACTIF]<='2'))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CKC_F050ACTIF_F050TIER]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CKC_F050CENTREGRP_F050TIER] CHECK  (([F050CENTREGRP]>='1' AND [F050CENTREGRP]<='2'))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CKC_F050CENTREGRP_F050TIER]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CKC_F050CTRLHR_F050TIER] CHECK  (([F050CTRLHR]>='1' AND [F050CTRLHR]<='2'))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CKC_F050CTRLHR_F050TIER]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CKC_F050FACUNI_F050TIER] CHECK  (([F050FACUNI]>='1' AND [F050FACUNI]<='2'))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CKC_F050FACUNI_F050TIER]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CKC_F050MOISF_F050TIER] CHECK  (([F050MOISF]>='1' AND [F050MOISF]<='2'))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CKC_F050MOISF_F050TIER]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CKC_F050NONDEMARCH_F050TIER] CHECK  (([F050NONDEMARCH]>='1' AND [F050NONDEMARCH]<='2'))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CKC_F050NONDEMARCH_F050TIER]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CKC_F050PLA_F050TIER] CHECK  (([F050PLA]>='1' AND [F050PLA]<='2'))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CKC_F050PLA_F050TIER]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CKC_F050PRECISIONJOUR_F050TIER] CHECK  (([F050PRECISIONJOUR]>=(-1) AND [F050PRECISIONJOUR]<=(1)))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CKC_F050PRECISIONJOUR_F050TIER]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CKC_F050REECH_F050TIER] CHECK  (([F050REECH]>='1' AND [F050REECH]<='2'))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CKC_F050REECH_F050TIER]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CKC_F050TAXPRO_F050TIER] CHECK  (([F050TAXPRO] IS NULL OR [F050TAXPRO]>='1' AND [F050TAXPRO]<='2'))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CKC_F050TAXPRO_F050TIER]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CV_F050TIERS_F050ACTIF] CHECK  (([F050ACTIF]<>''))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CV_F050TIERS_F050ACTIF]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CV_F050TIERS_F050CENTREGRP] CHECK  (([F050CENTREGRP]<>''))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CV_F050TIERS_F050CENTREGRP]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CV_F050TIERS_F050FACUNI] CHECK  (([F050FACUNI]<>''))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CV_F050TIERS_F050FACUNI]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CV_F050TIERS_F050KY] CHECK  (([F050KY]<>''))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CV_F050TIERS_F050KY]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CV_F050TIERS_F050MOISF] CHECK  (([F050MOISF]<>''))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CV_F050TIERS_F050MOISF]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CV_F050TIERS_F050NOM] CHECK  (([F050NOM]<>''))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CV_F050TIERS_F050NOM]
ALTER TABLE [dbo].[F050TIERS]  WITH CHECK ADD  CONSTRAINT [CV_F050TIERS_F050PLA] CHECK  (([F050PLA]<>''))
ALTER TABLE [dbo].[F050TIERS] CHECK CONSTRAINT [CV_F050TIERS_F050PLA]
