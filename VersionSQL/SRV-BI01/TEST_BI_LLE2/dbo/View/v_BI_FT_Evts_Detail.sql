/****** Object:  View [dbo].[v_BI_FT_Evts_Detail]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE     VIEW [dbo].[v_BI_FT_Evts_Detail] AS
SELECT
coalesce(BI_Dim_Agences.Code, 0) AS BI_Dim_Agences_dKey, 
coalesce(BI_Dim_Vehicules.Code, 0) AS BI_Dim_Vehicules_dKey, 
coalesce(BI_Dim_Clients.BI_Dim_Clients_dKey, 0) AS BI_Dim_Clients_dKey, 
coalesce(BI_Dim_Conducteurs.BI_Dim_Conducteurs_dKey, 0) AS BI_Dim_Conducteurs_dKey, 
coalesce(BI_Dim_Produits.BI_Dim_Produits_dKey, 0) AS BI_Dim_Produits_dKey, 
BI_FT_Evts_Detail_2.K400001SOC AS Societe, 
BI_FT_Evts_Detail_2.K400030AGE AS Agence, 
BI_FT_Evts_Detail_2.DTDEPFAC AS Date_de_depart_facture, 
BI_FT_Evts_Detail_2.DTARRFAC AS Date_de_retour_facture, 
BI_FT_Evts_Detail_2.Nb_jours_factures AS Nb_jours_factures, 
BI_FT_Evts_Detail_2.F400FACDT AS Date_piece, 
BI_FT_Evts_Detail_2.K410090UNI AS Code_vehicule, 
BI_FT_Evts_Detail_2.K400050TIE AS Code_tiers, 
BI_FT_Evts_Detail_2.K410050CON AS Code_conducteur, 
BI_FT_Evts_Detail_2.F400NMDOC AS Contrat, 
BI_FT_Evts_Detail_2.K400T44TYP AS Type_contrat, 
BI_FT_Evts_Detail_2.K410100PRO AS Code_produit, 
BI_FT_Evts_Detail_2.F400FACNM AS Piece, 
BI_FT_Evts_Detail_2.F410QT AS Quantite, 
BI_FT_Evts_Detail_2.F410MTHT AS Montant, 
BI_FT_Evts_Detail_2.Nb_kms AS Nb_kms, 
BI_FT_Evts_Detail_2.Nb_vehicules AS Nb_vehicules, 
BI_FT_Evts_Detail_2.Nb_jours_location AS Nb_jours_location
FROM
 (
  SELECT
  F400EVT.K400001SOC AS K400001SOC, F400EVT.F400FACNM AS F400FACNM, F400EVT.F400FACDT AS F400FACDT, F410LIG.F410QT AS F410QT, F410LIG.F410MTHT AS F410MTHT, F410LIG.K410090UNI AS K410090UNI, F400EVT.F400NMDOC AS F400NMDOC, F400EVT.K400050TIE AS K400050TIE, F400EVT.K400030AGE AS K400030AGE, F410LIG.K410050CON AS K410050CON, F410LIG.K410100PRO AS K410100PRO, coalesce(F410LIG.F410DTDEPFAC, F400EVT.F400DTDEPFAC ) AS DTDEPFAC, coalesce(F410LIG.F410DTARRFAC, F400EVT.F400DTARRFAC ) AS DTARRFAC, F400EVT.K400T44TYP AS K400T44TYP, F400EVT.K400090UNI AS K400090UNI, BI_tmp_F400_F570_nb_jours_kms.Nb_kms AS Nb_kms, BI_tmp_F400_F570_nb_jours_kms.Nb_vehicules AS Nb_vehicules, BI_tmp_F400_F570_nb_jours_kms.Nb_jours_loues AS Nb_jours_location, BI_tmp_F400_F570_nb_jours_kms.Nb_jours_factures AS Nb_jours_factures
  FROM
   F410LIG INNER JOIN  F400EVT ON(  F400EVT.F400KY = F410LIG.K410400EVT )
   INNER JOIN  BI_tmp_F400_F570_nb_jours_kms ON(  BI_tmp_F400_F570_nb_jours_kms.F400KY = F400EVT.F400KY )
 ) BI_FT_Evts_Detail_2 LEFT OUTER JOIN  BI_Dim_Clients ON(  BI_Dim_Clients.Code = BI_FT_Evts_Detail_2.K400050TIE )
 LEFT OUTER JOIN  BI_Dim_Conducteurs ON(  BI_Dim_Conducteurs.Code = BI_FT_Evts_Detail_2.K410050CON )
 LEFT OUTER JOIN  BI_Dim_Produits ON(  BI_Dim_Produits.Code = BI_FT_Evts_Detail_2.K410100PRO )
 LEFT OUTER JOIN  BI_Dim_Vehicules ON(  BI_Dim_Vehicules.Code = BI_FT_Evts_Detail_2.K410090UNI )
 LEFT OUTER JOIN  BI_Dim_Agences ON(  BI_Dim_Agences.Code = BI_FT_Evts_Detail_2.K400030AGE )
