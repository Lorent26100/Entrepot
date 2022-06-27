/****** Object:  View [dbo].[v_BI_tmp_mvts_nb_jours_F570KY]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW BI_tmp_mvts_nb_jours_F570KY AS SELECT
BI_tmp_mvts_nb_jours_F570KY_1.F570KY, 
BI_tmp_mvts_nb_jours_F570KY_1.Nb_jours, 
BI_tmp_mvts_nb_jours_F570KY_1.Nb_kms
FROM
 (
  SELECT
  BI_tmp_mvts_nb_jours_F570KY_2.F570KY AS F570KY, SUM(CAST(DATEDIFF(MI, BI_tmp_mvts_nb_jours_F570KY_2.F570DTDEP, BI_tmp_mvts_nb_jours_F570KY_2.F570DTARR) AS decimal(13,6)) / ((dbo.HeureFin() - dbo.HeureDebut())*60)) AS Nb_jours, MIN(BI_tmp_mvts_nb_jours_F570KY_2.Nb_kms) AS Nb_kms
  FROM
   (
    SELECT
    F570MVT_NIV_0.F570KY AS F570KY, CASE WHEN (F570MVT_NIV_0.F570DTDEP_date < Dim_Calendar.date_enreg) THEN DATEADD(MI, dbo.HeureDebut() * 60, CAST(Dim_Calendar.date_enreg  as datetime)) WHEN ((DATEPART(HH, F570MVT_NIV_0.F570DTDEP)  * 100 + DATEPART(MI, F570MVT_NIV_0.F570DTDEP)) < dbo.HeureDebutInteger()) THEN DATEADD(MI, dbo.HeureDebut() * 60, CAST(F570MVT_NIV_0.F570DTDEP_date as datetime)) WHEN ((DATEPART(HH, F570MVT_NIV_0.F570DTDEP)  * 100 + DATEPART(MI, F570MVT_NIV_0.F570DTDEP)) > dbo.HeureFinInteger()) THEN DATEADD(MI, dbo.HeureFin() * 60, CAST(F570MVT_NIV_0.F570DTDEP_date as datetime)) ELSE F570MVT_NIV_0.F570DTDEP END AS F570DTDEP, CASE WHEN (F570MVT_NIV_0.F570DTARR_date  > Dim_Calendar.date_enreg) THEN DATEADD(MI, dbo.HeureFin() * 60, CAST(Dim_Calendar.date_enreg as datetime)) WHEN ((DATEPART(HH, F570MVT_NIV_0.F570DTARR)  * 100 + DATEPART(MI, F570MVT_NIV_0.F570DTARR)) < dbo.HeureDebutInteger()) THEN DATEADD(MI, dbo.HeureDebut() * 60, CAST(F570MVT_NIV_0.F570DTARR_date AS datetime)) WHEN ((DATEPART(HH, F570MVT_NIV_0.F570DTARR)  * 100 + DATEPART(MI, F570MVT_NIV_0.F570DTARR)) > dbo.HeureFinInteger()) THEN DATEADD(MI, dbo.HeureFin() * 60, CAST(F570MVT_NIV_0.F570DTARR_date AS datetime)) ELSE F570MVT_NIV_0.F570DTARR END AS F570DTARR, F570MVT_NIV_0.Nb_kms AS Nb_kms
    FROM
     (
      SELECT
      F570MVT.F570KY AS F570KY, F570MVT.F570DTDEP AS F570DTDEP, CAST(F570MVT.F570DTDEP AS date) AS F570DTDEP_date, F570MVT.F570DTARR AS F570DTARR, CAST(F570MVT.F570DTARR AS date) AS F570DTARR_date, CASE WHEN (F570MVT.F570KMARR > 0) THEN F570MVT.F570KMARR - F570MVT.F570KMDEP END AS Nb_kms
      FROM
       F570MVT
     ) F570MVT_NIV_0 INNER JOIN  (
      SELECT
      BI_Dim_Calendar.date_enreg AS date_enreg
      FROM
       BI_Dim_Calendar
     ) Dim_Calendar ON(  Dim_Calendar.date_enreg >= F570MVT_NIV_0.F570DTDEP_date AND Dim_Calendar.date_enreg <= F570MVT_NIV_0.F570DTARR_date  )
   ) BI_tmp_mvts_nb_jours_F570KY_2
  GROUP BY BI_tmp_mvts_nb_jours_F570KY_2.F570KY 
  
 ) BI_tmp_mvts_nb_jours_F570KY_1
