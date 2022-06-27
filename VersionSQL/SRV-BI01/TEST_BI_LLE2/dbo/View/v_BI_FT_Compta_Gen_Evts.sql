/****** Object:  View [dbo].[v_BI_FT_Compta_Gen_Evts]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE   VIEW [dbo].[v_BI_FT_Compta_Gen_Evts] AS 
SELECT
coalesce(BI_Dim_Agences.Code, 0) AS BI_Dim_Agences_dKey, 
coalesce(BI_Dim_Vehicules.Code, 0) AS BI_Dim_Vehicules_dKey, 
coalesce(BI_Dim_Clients.Code, 0) AS BI_Dim_Clients_dKey, 
coalesce(BI_Dim_Conducteurs.BI_Dim_Conducteurs_dKey, 0) AS BI_Dim_Conducteurs_dKey, 
coalesce(BI_Dim_Produits.BI_Dim_Produits_dKey, 0) AS BI_Dim_Produits_dKey, 
coalesce(BI_Dim_Utilisateurs.BI_Dim_Utilisateurs_dKey, 0) AS BI_Dim_Utilisateurs_dKey, 
BI_FT_Compta_Gen_Evts_2.K350001SOC AS Societe, 
BI_FT_Compta_Gen_Evts_2.K350310JNX AS Journal, 
BI_FT_Compta_Gen_Evts_2.K350030AGE AS Agence, 
BI_FT_Compta_Gen_Evts_2.DTDEPFAC AS Date_de_depart_facture, 
BI_FT_Compta_Gen_Evts_2.DTARRFAC AS Date_de_retour_facture, 
CASE WHEN (BI_FT_Compta_Gen_Evts_2.F410QT <0) THEN - dbo.DateDiffJour(BI_FT_Compta_Gen_Evts_2.DTDEPFAC, BI_FT_Compta_Gen_Evts_2.DTARRFAC ) ELSE dbo.DateDiffJour(BI_FT_Compta_Gen_Evts_2.DTDEPFAC,BI_FT_Compta_Gen_Evts_2.DTARRFAC ) END   AS Nb_jours_factures, 
BI_FT_Compta_Gen_Evts_2.F350DTPIE AS Date_piece, 
BI_FT_Compta_Gen_Evts_2.L350090UNI AS Code_vehicule, 
BI_FT_Compta_Gen_Evts_2.L350050TIERRAT AS Code_tiers_rattache, 
BI_FT_Compta_Gen_Evts_2.L350050CON AS Code_conducteur, 
BI_FT_Compta_Gen_Evts_2.K350300CG AS Compte_general, 
BI_FT_Compta_Gen_Evts_2.F350NMDOC AS Contrat, 
BI_FT_Compta_Gen_Evts_2.K400T44TYP AS Type_contrat, 
BI_FT_Compta_Gen_Evts_2.K410100PRO AS Code_produit, 
BI_FT_Compta_Gen_Evts_2.F350PIECE AS Piece, 
BI_FT_Compta_Gen_Evts_2.F350DEB AS Debit, 
BI_FT_Compta_Gen_Evts_2.F350CRE AS Credit, 
BI_FT_Compta_Gen_Evts_2.K350000USR2 AS Code_utilisateur, 
BI_FT_Compta_Gen_Evts_2.Nb_kms AS Nb_kms, 
BI_FT_Compta_Gen_Evts_2.Nb_vehicules AS Nb_vehicules, 
BI_FT_Compta_Gen_Evts_2.Nb_jours_location AS Nb_jours_location
FROM
 (
  SELECT
  F350ECR.K350001SOC AS K350001SOC, F350ECR.K350310JNX AS K350310JNX, F350ECR.K350300CG AS K350300CG, F350ECR.F350PIECE AS F350PIECE, F350ECR.F350DTPIE AS F350DTPIE, F350ECR.F350DEB AS F350DEB, F350ECR.F350CRE AS F350CRE, F350ECR.L350090UNI AS L350090UNI, F350ECR.F350NMDOC AS F350NMDOC, F350ECR.L350050TIERRAT AS L350050TIERRAT, F350ECR.K350030AGE AS K350030AGE, F350ECR.L350050CON AS L350050CON, F410LIG.K410100PRO AS K410100PRO, F410LIG.F410QT AS F410QT, F410LIG.K410090UNI AS K410090UNI, coalesce(F410LIG.F410DTDEPFAC, F400EVT.F400DTDEPFAC ) AS DTDEPFAC, coalesce(F410LIG.F410DTARRFAC, F400EVT.F400DTARRFAC ) AS DTARRFAC, F400EVT.K400T44TYP AS K400T44TYP, F350ECR.K350000USR2 AS K350000USR2, BI_tmp_F400_F570_nb_jours_kms.Nb_kms AS Nb_kms, BI_tmp_F400_F570_nb_jours_kms.Nb_vehicules AS Nb_vehicules, BI_tmp_F400_F570_nb_jours_kms.Nb_jours_loues AS Nb_jours_location
  FROM
   F350ECR INNER JOIN  V310JRX ON(  V310JRX.F310KY = F350ECR.K350310JNX )
   LEFT OUTER JOIN  F410LIG ON(  F410LIG.F410KY = F350ECR.K350410LIG )
   LEFT OUTER JOIN  F400EVT ON(  F400EVT.F400KY = F410LIG.K410400EVT )
   LEFT OUTER JOIN  BI_tmp_F400_F570_nb_jours_kms ON(  BI_tmp_F400_F570_nb_jours_kms.F400KY = F400EVT.F400KY )
  WHERE
  V310JRX.K310T40TYP <> 'CLO'
 ) BI_FT_Compta_Gen_Evts_2 LEFT OUTER JOIN  BI_Dim_Clients ON(  BI_Dim_Clients.Code = BI_FT_Compta_Gen_Evts_2.L350050TIERRAT )
 LEFT OUTER JOIN  BI_Dim_Conducteurs ON(  BI_Dim_Conducteurs.Code = BI_FT_Compta_Gen_Evts_2.L350050CON )
 LEFT OUTER JOIN  BI_Dim_Produits ON(  BI_Dim_Produits.Code = BI_FT_Compta_Gen_Evts_2.K410100PRO )
 LEFT OUTER JOIN  BI_Dim_Vehicules ON(  BI_Dim_Vehicules.Code = BI_FT_Compta_Gen_Evts_2.L350090UNI )
 LEFT OUTER JOIN  BI_Dim_Agences ON(  BI_Dim_Agences.Code = BI_FT_Compta_Gen_Evts_2.K350030AGE )
 LEFT OUTER JOIN  BI_Dim_Utilisateurs ON(  BI_Dim_Utilisateurs.Code = BI_FT_Compta_Gen_Evts_2.K350000USR2 )
