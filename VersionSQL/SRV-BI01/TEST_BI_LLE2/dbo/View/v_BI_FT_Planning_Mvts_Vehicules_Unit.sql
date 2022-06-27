/****** Object:  View [dbo].[v_BI_FT_Planning_Mvts_Vehicules_Unit]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE     VIEW [dbo].[v_BI_FT_Planning_Mvts_Vehicules_Unit] AS
SELECT
COALESCE(BI_Dim_Vehicules.Code, 0) AS BI_Dim_Vehicules_dKey, 
COALESCE(BI_Dim_Agences.Code, 0) AS BI_Dim_Agences_dKey, 
BI_FT_Planning_Mvts_Vehicules_Unit_2.date_enreg AS Date, 
BI_FT_Planning_Mvts_Vehicules_Unit_2.K570090UNI AS Code_vehicule, 
BI_FT_Planning_Mvts_Vehicules_Unit_2.K570030DEP AS Code_agence, 
BI_FT_Planning_Mvts_Vehicules_Unit_2.K570T58POS AS Code_position, 
BI_FT_Planning_Mvts_Vehicules_Unit_2.Nb_jours AS Temps_journalier
FROM
 (
  SELECT
  BI_FT_Planning_Mvts_Vehicules_Unit_3.date_enreg AS date_enreg, BI_FT_Planning_Mvts_Vehicules_Unit_3.K570090UNI AS K570090UNI, BI_FT_Planning_Mvts_Vehicules_Unit_3.K570T58POS AS K570T58POS, BI_FT_Planning_Mvts_Vehicules_Unit_3.K570030DEP AS K570030DEP, SUM(CAST(DATEDIFF(MI, BI_FT_Planning_Mvts_Vehicules_Unit_3.F570DTDEP, BI_FT_Planning_Mvts_Vehicules_Unit_3.F570DTARR) AS decimal) / ((dbo.HeureFin() - dbo.HeureDebut())*60)) AS Nb_jours
  FROM
   (
    SELECT
    Dim_Calendar.date_enreg AS date_enreg, CASE WHEN (F570MVT.F570DTDEP_date < Dim_Calendar.date_enreg) THEN DATEADD(MI, dbo.HeureDebut() * 60, CAST(Dim_Calendar.date_enreg  as datetime)) WHEN ((DATEPART(HH, F570MVT.F570DTDEP)  * 100 + DATEPART(MI, F570MVT.F570DTDEP)) < dbo.HeureDebutInteger()) THEN DATEADD(MI, dbo.HeureDebut() * 60, CAST(F570MVT.F570DTDEP_date as datetime)) WHEN ((DATEPART(HH, F570MVT.F570DTDEP)  * 100 + DATEPART(MI, F570MVT.F570DTDEP)) > dbo.HeureFinInteger()) THEN DATEADD(MI, dbo.HeureFin() * 60, CAST(F570MVT.F570DTDEP_date as datetime)) ELSE F570MVT.F570DTDEP END AS F570DTDEP, CASE WHEN (F570MVT.F570DTARR_date  > Dim_Calendar.date_enreg) THEN DATEADD(MI, dbo.HeureFin() * 60, CAST(Dim_Calendar.date_enreg as datetime)) WHEN ((DATEPART(HH, F570MVT.F570DTARR)  * 100 + DATEPART(MI, F570MVT.F570DTARR)) < dbo.HeureDebutInteger()) THEN DATEADD(MI, dbo.HeureDebut() * 60, CAST(F570MVT.F570DTARR_date AS datetime)) WHEN ((DATEPART(HH, F570MVT.F570DTARR)  * 100 + DATEPART(MI, F570MVT.F570DTARR)) > dbo.HeureFinInteger()) THEN DATEADD(MI, dbo.HeureFin() * 60, CAST(F570MVT.F570DTARR_date AS datetime)) ELSE F570MVT.F570DTARR END AS F570DTARR, F570MVT.K570090UNI AS K570090UNI, F570MVT.K570030DEP AS K570030DEP, F570MVT.K570T58POS AS K570T58POS, F570MVT.F570KY AS F570KY
    FROM
     (
      SELECT
      F570MVT.F570KY AS F570KY, F570MVT.F570DTDEP AS F570DTDEP, CAST(F570MVT.F570DTDEP AS date) AS F570DTDEP_date, F570MVT.F570DTARR AS F570DTARR, CAST(F570MVT.F570DTARR  AS date) AS F570DTARR_date, F570MVT.K570090UNI AS K570090UNI, F570MVT.K570T58POS AS K570T58POS, F570MVT.K570030DEP AS K570030DEP
      FROM
       F570MVT
     ) F570MVT INNER JOIN  (
      SELECT
      BI_Dim_Calendar.date_enreg AS date_enreg
      FROM
       BI_Dim_Calendar
     ) Dim_Calendar ON(  Dim_Calendar.date_enreg >= F570MVT.F570DTDEP_date AND Dim_Calendar.date_enreg <= F570MVT.F570DTARR_date  )
   ) BI_FT_Planning_Mvts_Vehicules_Unit_3
  GROUP BY BI_FT_Planning_Mvts_Vehicules_Unit_3.date_enreg, BI_FT_Planning_Mvts_Vehicules_Unit_3.K570090UNI, BI_FT_Planning_Mvts_Vehicules_Unit_3.K570T58POS, BI_FT_Planning_Mvts_Vehicules_Unit_3.K570030DEP 
  
 ) BI_FT_Planning_Mvts_Vehicules_Unit_2 LEFT OUTER JOIN  BI_Dim_Agences ON(  BI_Dim_Agences.Code = BI_FT_Planning_Mvts_Vehicules_Unit_2.K570030DEP )
 LEFT OUTER JOIN  BI_Dim_Vehicules ON(  BI_Dim_Vehicules.Code = BI_FT_Planning_Mvts_Vehicules_Unit_2.K570090UNI )
