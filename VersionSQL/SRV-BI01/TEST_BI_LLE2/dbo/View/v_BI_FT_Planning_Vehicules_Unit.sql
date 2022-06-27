/****** Object:  View [dbo].[v_BI_FT_Planning_Vehicules_Unit]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE   VIEW [dbo].[v_BI_FT_Planning_Vehicules_Unit] AS SELECT
BI_FT_Planning_Vehicules_Categorie_Modele_2.BI_Dim_Vehicules_dKey, 
BI_FT_Planning_Vehicules_Categorie_Modele_2.date_enreg, 
BI_FT_Planning_Vehicules_Categorie_Modele_2.Code
FROM
 (
  SELECT
  BI_Dim_Vehicules.BI_Dim_Vehicules_dKey AS BI_Dim_Vehicules_dKey, BI_Dim_Calendar.date_enreg AS date_enreg, BI_Dim_Vehicules.Code AS Code
  FROM
   BI_Dim_Calendar INNER JOIN  (
    SELECT
    BI_Dim_Vehicules.Code AS BI_Dim_Vehicules_dKey, BI_Dim_Vehicules.Code AS Code, BI_Dim_Vehicules.Date_entree AS Date_entree, BI_Dim_Vehicules.Date_sortie AS Date_sortie, coalesce(BI_Dim_Vehicules.Date_sortie, coalesce(BI_Dim_Vehicules.Date_sortie_prevue , '31/12/2999')) AS Date_sortie_not_null
    FROM
     BI_Dim_Vehicules
   ) BI_Dim_Vehicules ON(  BI_Dim_Vehicules.Date_entree <= BI_Dim_Calendar.date_enreg AND  BI_Dim_Vehicules.Date_sortie_not_null > BI_Dim_Calendar.date_enreg )
 ) BI_FT_Planning_Vehicules_Categorie_Modele_2
