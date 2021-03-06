/****** Object:  Table [dbo].[F450CD]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[F450CD](
	[F450KY] [nvarchar](20) NOT NULL,
	[F450CONTRAT] [nvarchar](20) NULL,
	[K450T45TYP] [nvarchar](20) NOT NULL,
	[K450T48ETA] [nvarchar](20) NOT NULL,
	[K450030DEPF] [nvarchar](20) NULL,
	[K450030DEP] [nvarchar](20) NOT NULL,
	[K450030ARP] [nvarchar](20) NOT NULL,
	[K450030ARR] [nvarchar](20) NULL,
	[F450DTDEPF] [datetime] NULL,
	[F450DTARRF] [datetime] NULL,
	[F450DTDEP] [datetime] NULL,
	[F450DTARRP] [datetime] NULL,
	[F450DTARR] [datetime] NULL,
	[F450KMCUM] [decimal](23, 8) NOT NULL,
	[K450T25CAT] [nvarchar](20) NOT NULL,
	[K450T26ACR] [nvarchar](20) NULL,
	[F450JRDEM] [decimal](23, 8) NOT NULL,
	[F450KMDEM] [decimal](23, 8) NOT NULL,
	[F450REM] [decimal](23, 8) NULL,
	[K450T47CARB] [nvarchar](20) NULL,
	[F450CARBCUM] [decimal](23, 8) NULL,
	[F450NBECH] [smallint] NULL,
	[F450DUPAUTO] [char](1) NOT NULL,
	[K45011VTAR] [nvarchar](20) NULL,
	[R450CD] [nvarchar](20) NOT NULL,
	[F450AVENANT] [smallint] NULL,
	[R450400EVTTIE] [nvarchar](20) NOT NULL,
	[R450400EVTCON] [nvarchar](20) NULL,
	[K450400EVTTIE] [nvarchar](20) NOT NULL,
	[K450400EVTCON] [nvarchar](20) NULL,
	[R450570MVT] [nvarchar](20) NOT NULL,
	[K450570MVT] [nvarchar](20) NULL,
	[F450DOUBLEFAC] [char](1) NOT NULL,
	[F450ANNLIB] [nvarchar](30) NULL,
	[F450CARTNAT] [nvarchar](20) NULL,
	[F450DTEMIS] [datetime] NULL,
	[F450EVNOTES] [char](1) NOT NULL,
	[F450JUSTIF] [char](1) NOT NULL,
	[F450NMITV] [nvarchar](20) NULL,
	[F450NMRESA] [nvarchar](20) NULL,
	[F450NMVOUC] [nvarchar](20) NULL,
	[F450PLAFJR] [decimal](23, 8) NOT NULL,
	[F450PLAFMT] [decimal](23, 8) NOT NULL,
	[F450REFCLT] [nvarchar](60) NULL,
	[F450REFTRAN] [nvarchar](60) NULL,
	[K450050CON] [nvarchar](20) NULL,
	[K450050TIE] [nvarchar](20) NULL,
	[K450T60ANN] [nvarchar](20) NULL,
	[K450110TAR] [nvarchar](20) NULL,
	[K450111MET] [nvarchar](20) NULL,
	[K45011YPER] [nvarchar](20) NULL,
	[F450PLAFTARJR] [decimal](23, 8) NOT NULL,
	[F450PLAFTARKM] [decimal](23, 8) NOT NULL,
	[F450ACTIF] [char](1) NOT NULL,
	[F450CAUTION] [decimal](23, 8) NOT NULL,
	[F450DTRVAL] [datetime] NULL,
	[F450CLOS] [char](1) NOT NULL,
	[F450PLAFTARKMJRS] [decimal](23, 8) NOT NULL,
	[F450DEVCARBCUM] [decimal](23, 8) NULL,
	[F450CDP] [nvarchar](10) NULL,
	[F450TXREM] [decimal](23, 8) NULL,
	[F450MTREM] [decimal](23, 8) NULL,
	[F450IMMATREMP] [nvarchar](80) NULL,
	[F450TXREMCON] [decimal](23, 8) NULL,
	[K450050COM] [nvarchar](20) NULL,
	[K450T25CATTAR] [nvarchar](20) NULL,
	[F450REFTRAN2] [nvarchar](60) NULL,
	[F450INFOVOUCHER] [char](1) NOT NULL,
	[F450INFOFACT] [char](1) NOT NULL,
	[F450TARTO] [char](1) NOT NULL,
	[F450VERSRESA] [nvarchar](20) NULL,
	[F450MTREMCON] [decimal](23, 8) NULL,
	[F450CDREM] [char](1) NOT NULL,
	[F450CDREMCON] [char](1) NOT NULL,
	[F450HRJR] [char](1) NOT NULL,
	[F450KM2CUM] [decimal](23, 8) NULL,
	[F450KM2DEM] [decimal](23, 8) NULL,
	[K450030DEPLIEU] [nvarchar](20) NULL,
	[F450TXMAJO] [decimal](23, 8) NULL,
	[F450MOISF] [char](1) NULL,
	[F450FACLOYDU] [char](1) NULL,
	[F450CARB2CUM] [decimal](23, 8) NULL,
	[K450230POL] [nvarchar](20) NULL,
	[F450POLICE] [nvarchar](20) NULL,
	[F450ASSURANCE] [nvarchar](20) NULL,
	[F450ASSISTANCE] [nvarchar](20) NULL,
	[F450COURTIER] [nvarchar](20) NULL,
	[K450T25CATPLA] [nvarchar](20) NULL,
	[F450TYPVOUC] [nvarchar](20) NULL,
 CONSTRAINT [PK_F450CD] PRIMARY KEY CLUSTERED 
(
	[F450KY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
