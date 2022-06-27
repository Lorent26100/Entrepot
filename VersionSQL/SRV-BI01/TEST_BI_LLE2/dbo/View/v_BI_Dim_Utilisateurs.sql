/****** Object:  View [dbo].[v_BI_Dim_Utilisateurs]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE     VIEW [dbo].[v_BI_Dim_Utilisateurs] AS SELECT
ROW_NUMBER() OVER(ORDER BY F000USR.F000KY DESC) AS BI_Dim_Utilisateurs_dKey,
F000USR.F000KY AS Code, 
F000USR.F000NOMUSR AS Nom, 
F000USR.F000NIV AS Niveau
FROM
 F000USR
