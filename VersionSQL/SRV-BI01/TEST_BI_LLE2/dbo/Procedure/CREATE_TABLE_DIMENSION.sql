/****** Object:  Procedure [dbo].[CREATE_TABLE_DIMENSION]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : CREATE_TABLE_DIMENSION
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 23/06/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Création d'une table de dimension à partir de la vue existante
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--			@p_Table_Dimension NVARCHAR(50)	: Nom de la table de dimension
---------------------------------------------------------------------------------------------------
CREATE         PROCEDURE [dbo].[CREATE_TABLE_DIMENSION]
	@p_Table_Dimension	NVARCHAR(50)
AS
	DECLARE		@v_PROC_NAME		NVARCHAR(50)		=	'CREATE_TABLE_DIMENSION';
	DECLARE		@v_Vue_Dimension	NVARCHAR(50)	=	CONCAT('v_',@p_Table_Dimension);
	DECLARE		@v_REQ				NVARCHAR(max)
	DECLARE 	@v_LOG				NVARCHAR (max)
	DECLARE		@v_Message_erreur		NVARCHAR (max)	=	'';	

	SET @v_LOG =  'Début éxécution de la procédure pour la table : "' + @p_Table_Dimension + '"'
	
	EXEC INSERT_LOG						@p_TYPE = 'INFO', 
										@p_LIBELLE = @v_LOG, 
										@p_TRAITEMENT = @v_PROC_NAME

	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(@v_Vue_Dimension) AND type = 'V')
	BEGIN
		SET @v_Message_erreur	=  'La vue : "' + @v_Vue_Dimension + '" n''existe pas.'
		SET @v_LOG				=  'Il y''a des erreurs : sortie de la procédure pour la table : "' + @p_Table_Dimension + '"'

		EXEC [dbo].[INSERT_LOG]			@p_TYPE			=	'ERROR', 
										@p_LIBELLE		=	@v_Message_erreur, 
										@p_TRAITEMENT	=	@v_PROC_NAME

		EXEC INSERT_LOG					@p_TYPE			=	'INFO', 
										@p_LIBELLE		=	@v_LOG, 
										@p_TRAITEMENT	=	@v_PROC_NAME
		RETURN -1
	END
			

	SET @v_REQ = CONCAT('DROP TABLE ' , @p_Table_Dimension)
		
	IF (OBJECT_ID(@p_Table_Dimension) IS NOT NULL)  
	   EXEC (@v_REQ);


	SELECT	@v_REQ = 'CREATE TABLE [' + @p_Table_Dimension + '] (' +  STRING_AGG ((CONCAT(
					'[',COLUMN_NAME,'] [',DATA_TYPE,']', 
				(CASE	WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL THEN CONCAT('(',CHARACTER_MAXIMUM_LENGTH,')') 
						WHEN t.name = 'decimal' THEN CONCAT('(',c.precision,',',c.scale,')') END),
				(CASE c.is_identity WHEN 1 THEN ' IDENTITY(1,1)' END),
				(CASE ISC.is_nullable WHEN 'NO' THEN ' NOT NULL' ELSE ' NULL' END))),', ') + 
				', [_created_] [datetime] NULL, [_modified_] [datetime] NULL, [_deleted_] [datetime] NULL) ON [PRIMARY]' 
	FROM sys.columns AS c  
						INNER JOIN sys.objects AS o ON o.object_id = c.object_id
						INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
						INNER JOIN INFORMATION_SCHEMA.COLUMNS ISC ON TABLE_NAME = o.name  AND COLUMN_NAME = c.name
						WHERE c.object_id = OBJECT_ID(@v_Vue_Dimension) AND type = 'V'
	GROUP BY TABLE_NAME

	SELECT @v_REQ
	--EXEC sp_executesql @v_REQ;  
