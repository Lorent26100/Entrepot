/****** Object:  Table [dbo].[BI_Dim_Calendar]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[BI_Dim_Calendar](
	[BI_Dim_Calendar_dKey] [int] NOT NULL,
	[date_enreg] [date] NULL,
	[num_mois] [int] NULL,
	[num_semaine] [int] NULL,
	[annee] [int] NULL,
	[trimestre] [int] NULL,
	[mois] [nvarchar](20) NULL,
	[date_int] [int] NULL,
	[num_jour_semaine] [int] NULL,
	[jour] [nvarchar](20) NULL,
	[num_jour_annee] [int] NULL,
	[jour_travaille] [bit] NULL,
	[saison] [nvarchar](20) NULL
) ON [PRIMARY]
