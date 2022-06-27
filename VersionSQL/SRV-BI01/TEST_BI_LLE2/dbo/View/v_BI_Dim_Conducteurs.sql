/****** Object:  View [dbo].[v_BI_Dim_Conducteurs]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE     VIEW [dbo].[v_BI_Dim_Conducteurs] AS SELECT
ROW_NUMBER() OVER(ORDER BY F050TIERS.F050KY DESC) AS BI_Dim_Conducteurs_dKey,
F050TIERS.F050KY AS Code, 
F056COND.F056NAIDT AS Date_de_naissance, 
F050TIERS.F050NOM AS Nom, 
F050TIERS.F050PRENOM AS Prenom
FROM
 F050TIERS INNER JOIN  F056COND ON(  F056COND.F056050KY = F050TIERS.F050KY )
