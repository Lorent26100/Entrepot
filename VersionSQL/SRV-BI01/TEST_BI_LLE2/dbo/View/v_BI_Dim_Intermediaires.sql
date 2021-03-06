/****** Object:  View [dbo].[v_BI_Dim_Intermediaires]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE   VIEW [dbo].[v_BI_Dim_Intermediaires] AS
SELECT
F050TIERS.F050KY AS Code, 
F050TIERS.F050NOM AS Nom, 
F050TIERS.F050PRENOM AS Prenom, 
F020ADR.F020CP AS Code_postal, 
F020ADR.K020T53CTY AS Code_pays,
VT53CTY.F901MSG AS Libelle_pays, 
CASE WHEN F020ADR.K020T53CTY  != 'FR' THEN F020ADR.K020T53CTY  WHEN SUBSTRING(F020ADR.F020CP , 1, 2) = '97' THEN SUBSTRING(F020ADR.F020CP , 1, 3) ELSE SUBSTRING(F020ADR.F020CP , 1, 2) END AS Localisation,  
VT15TIT.FT15KY AS Code_titre, 
VT15TIT.F901MSG AS Libelle_titre, 
F050TIERS.F050IATA AS IATA, 
F050TIERS.F050APE AS Code_APE
FROM
 F050TIERS 
 INNER JOIN F05ZTYPE ON(  F05ZTYPE.K05Z050TIE = F050TIERS.F050KY ) AND F05ZTYPE.K05ZT05TYP = '6'
 INNER JOIN  VT15TIT ON(  VT15TIT.FT15KY = F050TIERS.K050T15TIT )
 INNER JOIN F020ADR ON(  F020ADR.F020KY = F050TIERS.K050020ADR )
 INNER JOIN VT53CTY ON(  VT53CTY.FT53KY = F020ADR.K020T53CTY )
