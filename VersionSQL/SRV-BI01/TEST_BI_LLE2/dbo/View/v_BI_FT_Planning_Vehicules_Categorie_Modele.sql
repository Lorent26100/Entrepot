﻿/****** Object:  View [dbo].[v_BI_FT_Planning_Vehicules_Categorie_Modele]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE     VIEW [dbo].[v_BI_FT_Planning_Vehicules_Categorie_Modele] AS 
SELECT
coalesce(BI_Dim_Agences.Code, 0) AS BI_Dim_Agences_dKey, 
BI_FT_Planning_Vehicules_Categorie_Modele_2.date_enreg, 
BI_FT_Planning_Vehicules_Categorie_Modele_2.Societe, 
BI_FT_Planning_Vehicules_Categorie_Modele_2.Agence, 
BI_FT_Planning_Vehicules_Categorie_Modele_2.Categorie, 
BI_FT_Planning_Vehicules_Categorie_Modele_2.Libelle_categorie, 
BI_FT_Planning_Vehicules_Categorie_Modele_2.Modele, 
COUNT (DISTINCT BI_FT_Planning_Vehicules_Categorie_Modele_2.Code) AS Nb_vehicules
FROM
 (
  SELECT
  BI_Dim_Calendar.date_enreg AS date_enreg, BI_Dim_Vehicules.Societe AS Societe, BI_Dim_Vehicules.Agence AS Agence, BI_Dim_Vehicules.Modele AS Modele, BI_Dim_Vehicules.Categorie AS Categorie, BI_Dim_Vehicules.Libelle_categorie AS Libelle_categorie, BI_Dim_Vehicules.Code AS Code
  FROM
   BI_Dim_Calendar INNER JOIN  (
    SELECT
    BI_Dim_Vehicules.Code AS Code, BI_Dim_Vehicules.Societe AS Societe, BI_Dim_Vehicules.Agence AS Agence, BI_Dim_Vehicules.Modele AS Modele, BI_Dim_Vehicules.Categorie AS Categorie, BI_Dim_Vehicules.Libelle_categorie AS Libelle_categorie, BI_Dim_Vehicules.Date_entree AS Date_entree, BI_Dim_Vehicules.Date_sortie AS Date_sortie, coalesce(BI_Dim_Vehicules.Date_sortie, coalesce(BI_Dim_Vehicules.Date_sortie_prevue , '31/12/2999')) AS Date_sortie_not_null
    FROM
     BI_Dim_Vehicules
   ) BI_Dim_Vehicules ON(  BI_Dim_Vehicules.Date_entree <= BI_Dim_Calendar.date_enreg AND  BI_Dim_Vehicules.Date_sortie_not_null > BI_Dim_Calendar.date_enreg )
 ) BI_FT_Planning_Vehicules_Categorie_Modele_2 LEFT OUTER JOIN  BI_Dim_Agences ON(  BI_Dim_Agences.Code = BI_FT_Planning_Vehicules_Categorie_Modele_2.Agence )
GROUP BY BI_Dim_Agences.Code, BI_FT_Planning_Vehicules_Categorie_Modele_2.date_enreg , BI_FT_Planning_Vehicules_Categorie_Modele_2.Societe , BI_FT_Planning_Vehicules_Categorie_Modele_2.Agence, BI_FT_Planning_Vehicules_Categorie_Modele_2.Categorie, BI_FT_Planning_Vehicules_Categorie_Modele_2.Libelle_categorie , BI_FT_Planning_Vehicules_Categorie_Modele_2.Modele  
