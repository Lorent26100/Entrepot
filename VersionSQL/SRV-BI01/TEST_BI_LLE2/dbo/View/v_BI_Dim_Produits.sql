﻿/****** Object:  View [dbo].[v_BI_Dim_Produits]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE     VIEW [dbo].[v_BI_Dim_Produits] AS
SELECT
ROW_NUMBER() OVER(ORDER BY V100PRO.F100KY DESC) AS BI_Dim_Produits_dKey,
V100PRO.F100KY AS Code, 
V100PRO.F901MSG AS Libelle, 
V100PRO.K100101CPT AS Code_famille_comptable, 
V101CPTA.F901MSG AS Libelle_famille_compta, 
V100PRO.K100TAAFAMPRO AS Code_famille, 
VTAAFAMPRO.F901MSG AS Libelle_famille, 
V100PRO.K100T33NAT AS Code_nature, 
VT33NAT.F901MSG AS Libelle_nature, 
F102CD.K102T31TYP AS Code_type_de_calcul, 
VT31TYP.F901MSG AS Libelle_type_de_calcul, 
CASE WHEN F10VLIG.K10V100PDT IS NULL THEN  0 ELSE 1 END AS CA_sans_remise, 
CASE WHEN F10VLIG.K10V100PDT IS NULL THEN  0 ELSE 1 END AS CA_avac_remise, 
CASE WHEN F10VLIG.K10V100PDT IS NULL THEN  0 ELSE 1 END AS CA_supp_surcharge_et_frais, 
CASE WHEN F10VLIG.K10V100PDT IS NULL THEN  0 ELSE 1 END AS CA_supplement, 
CASE WHEN F10VLIG.K10V100PDT IS NULL THEN  0 ELSE 1 END AS CA_Franchises, 
CASE WHEN F10VLIG.K10V100PDT IS NULL THEN  0 ELSE 1 END AS CA_carburant, 
CASE WHEN (F102CD.K102T31TYP IN ('1')) THEN 1 ELSE 0 END AS Loyer, 
CASE WHEN (F102CD.K102T31TYP IN ('9')) THEN 1 ELSE 0 END AS Loyer_remise, 
CASE WHEN (F102CD.K102T31TYP IN ('11')) THEN 1 ELSE 0 END AS Carburant, 
CASE WHEN (F102CD.K102T31TYP IN ('7')) THEN 1 ELSE 0 END AS Accessoires, 
CASE WHEN (F102CD.K102T31TYP IN ('4')) THEN 1 ELSE 0 END AS Compteur, 
CASE WHEN (F102CD.K102T31TYP IN ('41')) THEN 1 ELSE 0 END AS Compteur_tarif, 
CASE WHEN (F102CD.K102T31TYP IN ('2')) THEN 1 ELSE 0 END AS Loyer_supplementaire, 
CASE WHEN (F102CD.K102T31TYP IN ('111')) THEN 1 ELSE 0 END AS Carburant_addtionnel, 
CASE WHEN (F102CD.K102T31TYP IN ('12')) THEN 1 ELSE 0 END AS Pieces, 
CASE WHEN (F102CD.K102T31TYP IN ('5')) THEN 1 ELSE 0 END AS Compteur_supplementaire, 
CASE WHEN (F102CD.K102T31TYP IN ('6')) THEN 1 ELSE 0 END AS Assurances, 
CASE WHEN (F102CD.K102T31TYP IN ('3')) THEN 1 ELSE 0 END AS Heures_supplementaires, 
CASE WHEN (F102CD.K102T31TYP IN ('15')) THEN 1 ELSE 0 END AS Jours_arret, 
CASE WHEN (F102CD.K102T31TYP IN ('14')) THEN 1 ELSE 0 END AS Franchise, 
CASE WHEN (F102CD.K102T31TYP IN ('10')) THEN 1 ELSE 0 END AS Total, 
CASE WHEN (F102CD.K102T31TYP IN ('16')) THEN 1 ELSE 0 END AS JoursSpec, 
CASE WHEN (F102CD.K102T31TYP IN ('8')) THEN 1 ELSE 0 END AS Commentaire, 
CASE WHEN (F102CD.K102T31TYP IN ('9')) THEN 1 ELSE 0 END AS Remise_JK, 
CASE WHEN (F102CD.K102T31TYP IN ('98')) THEN 1 ELSE 0 END AS Deduction, 
CASE WHEN (F102CD.K102T31TYP IN ('99')) THEN 1 ELSE 0 END AS Autre
FROM
 V100PRO LEFT OUTER JOIN  V101CPTA ON(  V101CPTA.F101KY = V100PRO.K100101CPT )
 LEFT OUTER JOIN  VTAAFAMPRO ON(  VTAAFAMPRO.FTAAKY = V100PRO.K100TAAFAMPRO )
 LEFT OUTER JOIN  F10VLIG ON(  F10VLIG.K10V100PDT = V100PRO.F100KY ) AND F10VLIG.K10VT01GRP IN ('CDCASR','CDCAAR','CDCASSF','CDSUPP','CDFRANC','CDCARB')
 LEFT OUTER JOIN  VT33NAT ON(  VT33NAT.FT33KY = V100PRO.K100T33NAT )
 LEFT OUTER JOIN  F102CD ON(  F102CD.F102100KY = V100PRO.F100KY ) 
 INNER JOIN  VT31TYP ON(  VT31TYP.FT31KY = F102CD.K102T31TYP )
