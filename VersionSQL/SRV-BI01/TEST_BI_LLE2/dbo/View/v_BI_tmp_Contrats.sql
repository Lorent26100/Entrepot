﻿/****** Object:  View [dbo].[v_BI_tmp_Contrats]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW BI_tmp_Contrats AS 
SELECT
F450_VT45.F450KY, 
F450_VT45.K450030DEP, 
F450_VT45.K450030ARR, 
F450_VT45.F450DTDEP, 
F450_VT45.F450DTARR, 
F450_VT45.K450T25CAT, 
F450_VT45.K450T25CATTAR, 
F450_VT45.K450400EVTTIE, 
F450_VT45.K450T48ETA, 
F450_VT45.K450050CON, 
F450_VT45.F450CLOS, 
F450_VT45.R450570MVT, 
F450_VT45.F450KMCUM, 
F450_VT45.F450NMRESA, 
F450_VT45.F450CONTRAT, 
F450_VT45.R450400EVTTIE, 
F450_VT45.R450400EVTCON, 
F450_VT45.K450110TAR, 
F110TARIF.F110CODE, 
F450_VT45.F450HRJR, 
F450_VT45.Code_type_de_contrat, 
F450_VT45.Libelle_type_de_contrat, 
CASE WHEN (F450_VT45.K450T48ETA like '3%')  THEN 1 ELSE 0 END AS Depart, 
CASE WHEN (F450_VT45.K450T48ETA like '2%')  THEN 1 ELSE 0 END AS Statut_reservation, 
CASE WHEN (F450_VT45.F450CLOS = '2')  THEN 1 ELSE 0 END AS Statut_contrat, 
VT25CAT_reservation.FT25ORDRE AS Ordre_categorie_reservation, 
VT25CAT_facture.FT25ORDRE AS Ordre_categorie_facture, 
DATEDIFF(d, F900.F900DATE, F450_VT45.F450DTDEP) AS Delai_reservation, 
F900.F900DATE AS Date_reservation, 
F900.K900000USR2 AS Code_utilisateur
FROM
 (
  SELECT
  F450CD.F450KY AS F450KY, F450CD.K450030DEP AS K450030DEP, F450CD.K450030ARR AS K450030ARR, F450CD.F450DTDEP AS F450DTDEP, F450CD.F450DTARR AS F450DTARR, F450CD.K450T25CAT AS K450T25CAT, F450CD.K450T25CATTAR AS K450T25CATTAR, F450CD.K450400EVTTIE AS K450400EVTTIE, F450CD.K450T48ETA AS K450T48ETA, F450CD.K450050CON AS K450050CON, F450CD.F450CLOS AS F450CLOS, F450CD.R450570MVT AS R450570MVT, F450CD.F450KMCUM AS F450KMCUM, F450CD.F450NMRESA AS F450NMRESA, F450CD.F450CONTRAT AS F450CONTRAT, F450CD.R450400EVTTIE AS R450400EVTTIE, F450CD.R450400EVTCON AS R450400EVTCON, F450CD.K450110TAR AS K450110TAR, F450CD.F450HRJR AS F450HRJR, F450CD.K450T45TYP AS Code_type_de_contrat, VT45TYP.F901MSG AS Libelle_type_de_contrat
  FROM
   F450CD INNER JOIN  VT45TYP ON(  VT45TYP.FT45KY = F450CD.K450T45TYP )
  WHERE
  F450CD.K450T48ETA <> 'Z'
 ) F450_VT45 INNER JOIN  VT25CAT AS VT25CAT_reservation ON(  VT25CAT_reservation.FT25KY = F450_VT45.K450T25CAT )
 INNER JOIN  VT25CAT AS VT25CAT_facture ON(  VT25CAT_facture.FT25KY = F450_VT45.K450T25CATTAR )
 LEFT OUTER JOIN  (
  SELECT
  F900_agg_MIN_date.F900ENREG AS F900ENREG, F900_agg_MIN_date.F900DATE AS F900DATE, F900_agg_MIN_usr.K900000USR2 AS K900000USR2
  FROM
   (
    SELECT
    F900OPE.F900ENREG AS F900ENREG, MIN(F900OPE.F900DATE) AS F900DATE
    FROM
     F900OPE
    GROUP BY F900OPE.F900ENREG 
    
   ) F900_agg_MIN_date INNER JOIN  (
    SELECT
    F900OPE.F900ENREG AS F900ENREG, F900OPE.F900DATE AS F900DATE, MIN(F900OPE.K900000USR2) AS K900000USR2
    FROM
     F900OPE
    GROUP BY F900ENREG, F900DATE
    
   ) F900_agg_MIN_usr ON(  F900_agg_MIN_usr.F900ENREG = F900_agg_MIN_date.F900ENREG AND  F900_agg_MIN_usr.F900DATE = F900_agg_MIN_date.F900DATE )
 ) F900 ON(  F900.F900ENREG = F450_VT45.F450KY )
 LEFT OUTER JOIN  F110TARIF ON(  F110TARIF.F110KY = F450_VT45.K450110TAR )