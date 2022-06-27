/****** Object:  Procedure [dbo].[INSERT_LOG_TABLE_ACTION]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : INSERT_LOG_TABLE_ACTION
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 24/05/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Insert d'un LOG suite à action de mise à jour dans une table de dimension
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--		@p_TRAITEMENT varchar(50)	:	Traitement qui appelle la fonction		
--		@p_DATE datetime2,			:	Date d'éxécution du traitement
--		@p_TYPE_ACTION varchar(20)	:	'UPDATE', 'INSERT', DELETE'
--		@p_TABLE varchar(50)		:	Table sur laquelle l'action est effectuée
--		@p_KEY varchar(50)			:	Clé de la table
---------------------------------------------------------------------------------------------------
CREATE     PROCEDURE [dbo].[INSERT_LOG_TABLE_ACTION] 
	@p_TRAITEMENT		nvarchar(50),
	@p_DATE				datetime2,
	@p_TYPE_ACTION		nvarchar(20),
	@p_TABLE			nvarchar(50),
	@p_KEY				nvarchar(50)
AS
BEGIN
	-- DECLARATION DES VARIABLES LOCALES
	DECLARE @v_PROC_NAME	nvarchar(50) = (SELECT OBJECT_NAME(@@PROCID))
	DECLARE @v_RECORD_LIST	nvarchar(MAX)
	DECLARE @v_LIBELLE		nvarchar(MAX)

	
	-- Construction de la chaine à inscrire dans la table de LOG
	SELECT @v_LIBELLE = CASE @p_TYPE_ACTION		WHEN	'INSERT'	THEN 'Insertion' 
												WHEN	'UPDATE'	THEN 'Mise à jour' 
												WHEN	'DELETE'	THEN 'Suppression' END; 
	SET @v_LIBELLE += ' des enregistrements : ' 


	BEGIN TRY  
		EXECUTE [dbo].[GET_RECORD_LIST]		@p_ACTION_TYPE	=	@p_TYPE_ACTION,  
											@p_TABLE		=	@p_TABLE, 
											@p_KEY			=	@p_KEY, 
											@p_DATE			=	@p_DATE, 
											@p_RECORD		=	@v_RECORD_LIST		OUTPUT

		IF @v_RECORD_LIST IS NOT NULL
		BEGIN
			SET @v_LIBELLE += @v_RECORD_LIST
		
			EXECUTE [dbo].[INSERT_LOG]			@p_TYPE			=	'DEBUG',
 												@p_LIBELLE		=	@v_LIBELLE,
  												@p_TRAITEMENT	=	@p_TRAITEMENT
		END
	END TRY  
	BEGIN CATCH  
		SELECT @v_LIBELLE = CAST(ERROR_NUMBER() AS VARCHAR) + ' : ' + ERROR_MESSAGE()

		EXEC [dbo].[INSERT_LOG]				@p_TYPE			=	'ERROR', 
											@p_LIBELLE		=	@v_LIBELLE, 
											@p_TRAITEMENT	=	@v_PROC_NAME
	END CATCH;  
END
