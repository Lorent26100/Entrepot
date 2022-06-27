/****** Object:  Procedure [dbo].[FEED_DATAWAREHOUSE]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : FEED_DATAWAREHOUSE
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 23/06/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Remplit les tables de l'entrepôt de données
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--
---------------------------------------------------------------------------------------------------
CREATE     PROCEDURE [dbo].[FEED_DATAWAREHOUSE]  

AS  
	DECLARE @v_PROC_NAME				NVARCHAR(50)	=	(SELECT OBJECT_NAME(@@PROCID))
	DECLARE @v_LOG						NVARCHAR (max)	=	''
	DECLARE @v_IS_LINKED_SERVER			BIT				=	(SELECT TOP 1 PARAM_VALUE FROM BI_PARAMETERS WHERE PARAM_TYPE = '5' AND PARAM_ACTIF  = 1)
	DECLARE @v_IS_DIM_TABLE_CREATION	BIT				=	(SELECT TOP 1 PARAM_VALUE FROM BI_PARAMETERS WHERE PARAM_TYPE = '6' AND PARAM_ACTIF  = 1)
	DECLARE @v_IS_UPDATE_FK				BIT				=	(SELECT TOP 1 PARAM_VALUE FROM BI_PARAMETERS WHERE PARAM_TYPE = '7' AND PARAM_ACTIF  = 1)
	DECLARE @v_IS_UPDATE_DIM_CALENDAR	BIT				=	(SELECT TOP 1 PARAM_VALUE FROM BI_PARAMETERS WHERE PARAM_TYPE = '8' AND PARAM_ACTIF  = 1)
	DECLARE @v_Linked_Server_Name		NVARCHAR(50)	=	''
	DECLARE @v_DataBase_Name			NVARCHAR(50)	=	''
	DECLARE @v_Dim_Table				NVARCHAR(50)	=	''
	DECLARE @v_Start_Date_Dim_Calendar	NVARCHAR(50)	=	(SELECT TOP 1 PARAM_VALUE FROM BI_PARAMETERS WHERE PARAM_TYPE = '9' AND PARAM_ACTIF  = 1)
	
	DECLARE DIM_TABLE CURSOR FOR   
			SELECT PARAM_VALUE FROM BI_PARAMETERS WHERE PARAM_TYPE = '2' AND PARAM_ACTIF  = 1

	SET @v_LOG =  'Début éxécution de la procédure'

	EXEC INSERT_LOG						@p_TYPE = 'INFO', 
										@p_LIBELLE = @v_LOG, 
										@p_TRAITEMENT = @v_PROC_NAME


	SELECT @v_LOG = CONCAT('ETATS DES FLAGS => ',STRING_AGG(PARAM, ' ** ')) FROM
	(
		SELECT CONCAT(PARAM_LIB_LIBELLE,': <', STRING_AGG (PARAM_VALUE, ' // '),'>') AS PARAM FROM BI_PARAMETERS
		INNER JOIN BI_PARAMETERS_LIBELLE ON PARAM_TYPE = PARAM_LIB_ID
		WHERE PARAM_ACTIF = 1 AND PARAM_TYPE IN (5,6,7,8)
		GROUP BY PARAM_LIB_LIBELLE
	) AS TAB

	EXEC INSERT_LOG						@p_TYPE = 'INFO', 
										@p_LIBELLE = @v_LOG, 
										@p_TRAITEMENT = @v_PROC_NAME

	IF @v_IS_UPDATE_DIM_CALENDAR = 1
	BEGIN
		EXECUTE [dbo].[CREATE_BI_DIM_CALENDAR]
						@p_StartDate = @v_Start_Date_Dim_Calendar
	END

	IF @v_IS_UPDATE_FK = 1
	BEGIN
		EXECUTE [dbo].[UPDATE_FK_GESTION] 
	END

	IF @v_IS_LINKED_SERVER = 1
	BEGIN
		SELECT TOP 1 @v_Linked_Server_Name	=  PARAM_VALUE FROM BI_PARAMETERS WHERE PARAM_TYPE = '3' AND PARAM_ACTIF  = 1
		SELECT TOP 1 @v_DataBase_Name		=  PARAM_VALUE FROM BI_PARAMETERS WHERE PARAM_TYPE = '4' AND PARAM_ACTIF  = 1
		
		EXECUTE [dbo].[DELETE_FK]
		
		EXECUTE [dbo].[GET_LOCPRO_DATA] 
								   @v_Linked_Server_Name
								  ,@v_DataBase_Name
		
		EXECUTE [dbo].[CREATE_FK]
	END

	IF @v_IS_DIM_TABLE_CREATION = 1
	BEGIN
		OPEN DIM_TABLE
		FETCH NEXT FROM DIM_TABLE INTO @v_Dim_Table
		WHILE @@FETCH_STATUS = 0  
		BEGIN 
			EXEC [dbo].[CREATE_TABLE_DIMENSION] @p_Table_Dimension = @v_Dim_Table
			FETCH NEXT FROM DIM_TABLE INTO @v_Dim_Table
		END   
		CLOSE DIM_TABLE;  
		--DEALLOCATE DIM_TABLE;  
	END

	OPEN DIM_TABLE
	FETCH NEXT FROM DIM_TABLE INTO @v_Dim_Table
	WHILE @@FETCH_STATUS = 0  
	BEGIN 
		EXEC [dbo].[UPDATE_TABLE_DIM] @p_Table_Dimension = @v_Dim_Table
		FETCH NEXT FROM DIM_TABLE INTO @v_Dim_Table
	END   
	CLOSE DIM_TABLE;  
	DEALLOCATE DIM_TABLE;  
		
		
