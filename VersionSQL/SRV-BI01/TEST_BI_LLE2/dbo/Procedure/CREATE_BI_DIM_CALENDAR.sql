/****** Object:  Procedure [dbo].[CREATE_BI_DIM_CALENDAR]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : CREATE_BI_DIM_CALENDAR
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 24/05/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Initialisation de BI_DIM_CALENDAR
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--			@p_StartDate  date	: Nom du serveur lié
---------------------------------------------------------------------------------------------------
CREATE   PROCEDURE [dbo].[CREATE_BI_DIM_CALENDAR]
	@p_StartDate  date = '20100101'
AS
	DECLARE @v_PROC_NAME				NVARCHAR(50)	=	(SELECT OBJECT_NAME(@@PROCID))
	DECLARE @v_LOG						NVARCHAR (max)	=	''

	SET @v_LOG =  'Début éxécution de la procédure avec @p_StartDate : "' + CAST(@p_StartDate AS NVARCHAR) + '"'

	EXEC INSERT_LOG						@p_TYPE = 'INFO', 
										@p_LIBELLE = @v_LOG, 
										@p_TRAITEMENT = @v_PROC_NAME

	-- Vidange de la table BI_Dim_Calendar si elle n'est pas vide
	IF ((SELECT COUNT(1) from BI_Dim_Calendar) > 0)
		TRUNCATE TABLE BI_Dim_Calendar;
	
	-- Date de fin = date de départ + 30 ans
	DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, 30, @p_StartDate));
	
	;WITH seq(n) AS 
	(
	  SELECT 0 UNION ALL SELECT n + 1 FROM seq
	  WHERE n < DATEDIFF(DAY, @p_StartDate, @CutoffDate)
	),
	d(d) AS 
	(
	  SELECT DATEADD(DAY, n, @p_StartDate) FROM seq
	),
	src AS
	(
	  SELECT
		ROW_NUMBER() OVER (ORDER BY CONVERT(date, d)) AS t,
		date_enreg			=	CONVERT(date, d),
		num_mois			=	DATEPART(MONTH,     d),
		num_semaine			=	DATEPART(WEEK,      d),
		annee				=	DATEPART(YEAR,      d),
		trimestre			=	DATEPART(Quarter,   d),
		mois				=	DATENAME(MONTH,     d),
		date_int			=	CAST(CONVERT(CHAR(8),d,112) AS INT),
		num_jour_semaine	=	DATEPART(WEEKDAY,   d),
		jour				=	DATENAME(WEEKDAY,   d),
		num_jour_annee		=	DATEPART(DAYOFYEAR, d),
		jour_travaille		=	CASE	WHEN DATEPART(WEEKDAY,   d) IN (6,7)			THEN 0 
																						ELSE 1 END,
		saison				=	CASE	WHEN DATEPART(DAYOFYEAR, d) BETWEEN 78 AND 171	THEN 'Printemps'
										WHEN DATEPART(DAYOFYEAR, d) BETWEEN 172 AND 265 THEN 'Eté'		
										WHEN DATEPART(DAYOFYEAR, d) BETWEEN 266 AND 354 THEN 'Automne'
																						ELSE 'Hiver' END
	  FROM d
	)

	-- Insertion des élèments calculés dans la table BI_Dim_Calendar
	INSERT INTO		BI_Dim_Calendar 
					SELECT * FROM src
					ORDER BY date_enreg
					OPTION (MAXRECURSION 0);

	SET @v_LOG =  'Fin éxécution de la procédure'

	EXEC INSERT_LOG						@p_TYPE = 'INFO', 
										@p_LIBELLE = @v_LOG, 
										@p_TRAITEMENT = @v_PROC_NAME
