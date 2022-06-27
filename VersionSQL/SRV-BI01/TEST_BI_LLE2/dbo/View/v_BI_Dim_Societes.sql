/****** Object:  View [dbo].[v_BI_Dim_Societes]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE   VIEW [dbo].[v_BI_Dim_Societes] AS 
SELECT
F001SOC.F001KY AS Code, 
F001SOC.F001RAISSOC AS Raison_sociale, 
F001SOC.F001SIRET AS Siret
FROM
 F001SOC
