/****** Object:  Table [dbo].[F100PRO]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[F100PRO](
	[F100KY] [nvarchar](20) NOT NULL,
	[L100901NUM] [nvarchar](20) NULL,
	[K100101CPT] [nvarchar](20) NOT NULL,
	[F100STO] [char](1) NOT NULL,
	[F100HTTTC] [char](1) NOT NULL,
	[F100MTU] [decimal](23, 8) NULL,
	[K100T55TVAC] [nvarchar](20) NOT NULL,
	[K100T29CAL] [nvarchar](20) NOT NULL,
	[K100T33NAT] [nvarchar](20) NULL,
	[F100ACTIF] [char](1) NOT NULL,
	[F100VIS] [char](1) NOT NULL,
	[K100T91USTO] [nvarchar](20) NULL,
	[F100COEFVE] [decimal](23, 8) NULL,
	[F100COEFAC] [decimal](23, 8) NULL,
	[F100PRIX] [decimal](23, 8) NULL,
	[F100PAMP] [decimal](23, 8) NULL,
	[F100PVMP] [decimal](23, 8) NULL,
	[F100POIDS] [decimal](23, 8) NULL,
	[F100UNITPDS] [nvarchar](20) NULL,
	[K100T92NIV] [nvarchar](20) NOT NULL,
	[F100LDPRORA] [char](1) NOT NULL,
	[F100LDELIG] [char](1) NOT NULL,
	[F100LDELIB] [char](1) NOT NULL,
	[F100LDEQT] [char](1) NOT NULL,
	[F100LDEMTU] [char](1) NOT NULL,
	[K100TAAFAMPRO] [nvarchar](20) NULL,
	[F100VEHACHVEN] [char](1) NOT NULL,
	[K100TA8CARB] [nvarchar](20) NULL,
	[K100TB4CALENT] [nvarchar](20) NULL,
	[K100T58POS] [nvarchar](20) NULL,
	[K100TB6FCTT] [nvarchar](20) NULL,
	[F100DIRECT] [nvarchar](20) NULL,
	[F100ENTORDRE] [nvarchar](20) NULL,
	[F100LDORDRE] [nvarchar](3) NULL,
	[F100GLOBAL] [char](1) NOT NULL,
	[K100TE1AFFMT] [nvarchar](20) NULL,
	[F100QT] [decimal](23, 8) NULL,
	[F100FACDEB] [char](1) NOT NULL,
	[F100FACFIN] [char](1) NOT NULL,
	[F100FACNOR] [char](1) NOT NULL,
	[K100001SOC] [nvarchar](20) NULL,
	[K100TH4HRTYP] [nvarchar](20) NULL,
	[K100TH4HRSTYP] [nvarchar](20) NULL,
	[F100MODSAIS] [char](1) NOT NULL,
	[K100TJ0PROMVT] [nvarchar](20) NULL,
	[K100TAACTRL] [nvarchar](20) NULL,
	[K100TI8CPT] [nvarchar](20) NULL,
	[F100AFFMODLIG] [char](1) NOT NULL,
	[F100QTBIS] [numeric](23, 8) NULL,
	[K100TB3AFFQTBIS] [nvarchar](20) NULL,
	[F100DELMTNULLD] [char](1) NULL,
	[K100T58DEP] [nvarchar](20) NULL,
	[K100T58ARR] [nvarchar](20) NULL,
	[F100COULEUR] [nvarchar](20) NULL,
	[K100TG8BUDPRO] [nvarchar](20) NULL,
	[K100100AFFQT] [nvarchar](20) NULL,
	[K100100AFFMT] [nvarchar](20) NULL,
	[K100100AFFQTBIS] [nvarchar](20) NULL,
	[K100TI1TYPGAR] [nvarchar](20) NULL,
	[F100EAN] [nvarchar](128) NULL,
	[F100TERMEFIXE] [char](1) NOT NULL,
	[F100CODE] [nvarchar](20) NULL,
	[K100TD7UNITE] [nvarchar](20) NULL,
 CONSTRAINT [PK_F100PRO] PRIMARY KEY CLUSTERED 
(
	[F100KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
