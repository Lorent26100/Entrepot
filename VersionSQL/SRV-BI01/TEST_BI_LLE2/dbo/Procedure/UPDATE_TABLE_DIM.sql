/****** Object:  Procedure [dbo].[UPDATE_TABLE_DIM]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : UPDATE_TABLE_DIM
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 10/06/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Mise à jour de la table de fait ou de dimension
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--			@p_Table_Dimension  NVARCHAR(50)	: Nom de la table à mettre à jour
---------------------------------------------------------------------------------------------------
CREATE   PROCEDURE [dbo].[UPDATE_TABLE_DIM]
	@p_Table_Dimension  NVARCHAR(50) 
AS

	DECLARE @v_PROC_NAME					NVARCHAR(50)	=	(SELECT OBJECT_NAME(@@PROCID)),
			@v_Vue_Dimension				NVARCHAR(50)	=	CONCAT('v_',@p_Table_Dimension),
			@v_Table_Temp					NVARCHAR(50)	=	CONCAT('#',@p_Table_Dimension,'_updated'),
			@v_REQ							NVARCHAR(max),
			@v_LOG							NVARCHAR (max),
			@v_Liste_Champs_vue				NVARCHAR (max),
			@v_Liste_Champs_table_temp		NVARCHAR (max),
			@v_Elts_Jointure				NVARCHAR (max),
			@v_DATE_MAJ						datetime2		=	GETDATE(),
			@v_Key_Table_Dimension			varchar(50)		=	NULL
	
	DECLARE @v_Drap_erreur			bit				=	0
	DECLARE	@v_Message_erreur		NVARCHAR (max)	=	'';

	SET @v_LOG =  'Début éxécution de la procédure pour la table : "' + @p_Table_Dimension + '"'

	EXEC INSERT_LOG						@p_TYPE = 'INFO', 
										@p_LIBELLE = @v_LOG, 
										@p_TRAITEMENT = @v_PROC_NAME

	EXEC INSERT_LOG						@p_TYPE = 'INFO', 
										@p_LIBELLE ='Début des opérations de contrôles', 
										@p_TRAITEMENT = @v_PROC_NAME

	-- Test d'existence de la table
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(@p_Table_Dimension) AND type = 'U') 
	BEGIN
		SET @v_Drap_erreur = 1;
		
		SET @v_Message_erreur = 'La table "' + @p_Table_Dimension + '" n''existe pas';

		EXEC [dbo].[INSERT_LOG]			@p_TYPE			=	'ERROR', 
										@p_LIBELLE		=	@v_Message_erreur, 
										@p_TRAITEMENT	=	@v_PROC_NAME
	END
	-- Test d'existence de la vue
	IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(@v_Vue_Dimension) AND type = 'V') 
	BEGIN
		SET @v_Drap_erreur = 1;
		
		SET @v_Message_erreur = 'La vue "' + @v_Vue_Dimension + '" n''existe pas';

		EXEC [dbo].[INSERT_LOG]			@p_TYPE			=	'ERROR', 
										@p_LIBELLE		=	@v_Message_erreur, 
										@p_TRAITEMENT	=	@v_PROC_NAME
	END
	-- Si il y'a une erreur on sort de la procédure stockée
	IF @v_Drap_erreur <> 0
	BEGIN
		SET @v_LOG =  'Il y''a des erreurs : sortie de la procédure pour la table : "' + @p_Table_Dimension + '"'
		
		EXEC INSERT_LOG					@p_TYPE			=	'INFO', 
										@p_LIBELLE		=	@v_LOG, 
										@p_TRAITEMENT	=	@v_PROC_NAME
		RETURN -1
	END

	-- Récupération du champ de clé primaire de la table
	SELECT  TOP 1 @v_Key_Table_Dimension =	c.name
											FROM sys.columns AS c  
											JOIN sys.objects AS o ON o.object_id = c.object_id
											JOIN sys.types t ON c.user_type_id = t.user_type_id
											WHERE c.object_id = OBJECT_ID(@p_Table_Dimension) 
											AND c.name like ('%dKey%') AND type = 'U'
	
	-- Si la table ne contient pas de champ clé
	IF (@v_Key_Table_Dimension IS NULL)
	BEGIN
		SET @v_Message_erreur =  'La table : "' + @p_Table_Dimension + '" ne contient pas de champ "dkey" '
		SET @v_LOG =  'Il y''a des erreurs : sortie de la procédure pour la table : "' + @p_Table_Dimension + '"'

		EXEC [dbo].[INSERT_LOG]			@p_TYPE			=	'ERROR', 
										@p_LIBELLE		=	@v_Message_erreur, 
										@p_TRAITEMENT	=	@v_PROC_NAME

		EXEC INSERT_LOG					@p_TYPE			=	'INFO', 
										@p_LIBELLE		=	@v_LOG, 
										@p_TRAITEMENT	=	@v_PROC_NAME
		RETURN -1
	END

	-- Pas de champs dans la table
	IF (SELECT COUNT(1) FROM sys.columns AS c  
					INNER JOIN sys.objects AS o ON o.object_id = c.object_id
					INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
					WHERE c.object_id = OBJECT_ID(@p_Table_Dimension) 
					AND c.name not in ('_created_','_modified_','_deleted_')
					AND c.name not like ('%dKey%') AND type = 'U') <= 0
	BEGIN	
		SET @v_Drap_erreur = 1;

		SET @v_Message_erreur = 'La Table "' + @p_Table_Dimension + '" ne contient pas de champs';

		EXEC [dbo].[INSERT_LOG]			@p_TYPE			=	'ERROR', 
										@p_LIBELLE		=	@v_Message_erreur, 
										@p_TRAITEMENT	=	@v_PROC_NAME
	END

	-- Pas de champs dans la vue
	IF (SELECT COUNT(1) FROM sys.columns AS c  
					INNER JOIN sys.objects AS o ON o.object_id = c.object_id
					INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
					WHERE c.object_id = OBJECT_ID(@v_Vue_Dimension) 
					AND c.name not in ('_created_','_modified_','_deleted_')
					AND c.name not like ('%dKey%') AND type = 'V') <= 0
	BEGIN
		SET @v_Drap_erreur = 1;

		SET @v_Message_erreur = 'La vue "' + @v_Vue_Dimension + '" ne contient pas de champs';

		EXEC [dbo].[INSERT_LOG]			@p_TYPE			=	'ERROR', 
										@p_LIBELLE		=	@v_Message_erreur, 
										@p_TRAITEMENT	=	@v_PROC_NAME
	END

	-- Si il y'a une erreur on sort de la procédure stockée
	IF @v_Drap_erreur <> 0
	BEGIN
		SET @v_LOG =  'Il y''a des erreurs : sortie de la procédure pour la table : "' + @p_Table_Dimension + '"'
		
		EXEC INSERT_LOG					@p_TYPE			=	'INFO', 
										@p_LIBELLE		=	@v_LOG, 
										@p_TRAITEMENT	=	@v_PROC_NAME
		RETURN -1
	END
	
	IF  OBJECT_ID('tempdb..#T') IS NOT NULL
	BEGIN
		DROP TABLE #T;
	END

	SELECT	
		STRING_AGG ((CASE WHEN CHAMPS_TABLE.name IS NOT NULL THEN CHAMPS_TABLE.name END),' / ') as liste_champs_table ,
		STRING_AGG ((CASE WHEN CHAMPS_VUE.name IS NOT NULL THEN CHAMPS_VUE.name END),' / ') as liste_champs_vue
	INTO #T
	FROM (SELECT c.name FROM sys.columns AS c  
						INNER JOIN sys.objects AS o ON o.object_id = c.object_id
						INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
						WHERE c.object_id = OBJECT_ID(@p_Table_Dimension) 
						AND c.name not in ('_created_','_modified_','_deleted_')
						AND c.name not like ('%dKey%') AND type = 'U') AS CHAMPS_TABLE
	FULL JOIN (SELECT c.name FROM sys.columns AS c  
						INNER JOIN sys.objects AS o ON o.object_id = c.object_id
						INNER JOIN sys.types t ON c.user_type_id = t.user_type_id
						WHERE c.object_id = OBJECT_ID(@v_Vue_Dimension) 
						AND c.name not in ('_created_','_modified_','_deleted_')
						AND c.name not like ('%dKey%') AND type = 'V') CHAMPS_VUE ON CHAMPS_TABLE.name = CHAMPS_VUE.name
	WHERE CHAMPS_TABLE.name IS NULL
	OR CHAMPS_VUE.name IS NULL

	IF EXISTS(select 1 from #T where liste_champs_table IS NOT NULL)
	BEGIN
		SET @v_Drap_erreur = 1;
		
		SET @v_Message_erreur = 'Les champs suivants devraient être présents dans la vue "' + @v_Vue_Dimension + '" : ' + (SELECT liste_champs_table FROM #T);


		EXEC [dbo].[INSERT_LOG]			@p_TYPE			=	'ERROR', 
										@p_LIBELLE		=	@v_Message_erreur, 
										@p_TRAITEMENT	=	@v_PROC_NAME
	END

	IF EXISTS(select 1 from #T where liste_champs_vue IS NOT NULL)
	BEGIN
		SET @v_Drap_erreur = 1;

		SET @v_Message_erreur = 'Les champs suivants devraient être présents dans la table "' + @p_Table_Dimension + '" : ' + (SELECT liste_champs_vue FROM #T);
		
		EXEC [dbo].[INSERT_LOG]			@p_TYPE			=	'ERROR', 
										@p_LIBELLE		=	@v_Message_erreur, 
										@p_TRAITEMENT	=	@v_PROC_NAME
	END

	-- Si il y'a une erreur on sort de la procédure stockée
	IF @v_Drap_erreur <> 0
	BEGIN
		SET @v_LOG =  'Il y''a des erreurs : sortie de la procédure pour la table : "' + @p_Table_Dimension + '"'

		EXEC INSERT_LOG					@p_TYPE			=	'INFO', 
										@p_LIBELLE		=	@v_LOG, 
										@p_TRAITEMENT	=	@v_PROC_NAME
		RETURN -1
	END
	ELSE 
	BEGIN
	   EXEC INSERT_LOG					@p_TYPE			=	'INFO', 
										@p_LIBELLE		=	'Début de création de la requête dynamique', 
										@p_TRAITEMENT	=	@v_PROC_NAME
	END

	SELECT @v_Liste_Champs_vue		=	STRING_AGG (CONCAT(@v_Vue_Dimension,'.', c.name),' ,')
										FROM sys.columns AS c 
										JOIN sys.objects AS o ON o.object_id = c.object_id
										JOIN sys.types t ON c.user_type_id = t.user_type_id
										WHERE c.object_id = OBJECT_ID(@v_Vue_Dimension ) 
										AND c.name not in ('_created_','_modified_','_deleted_') AND type = 'V'
										AND c.name not like ('%dKey%') 

	SELECT @v_Liste_Champs_table_temp =	STRING_AGG (CONCAT(@v_Table_Temp,'.', c.name),' ,')
										FROM sys.columns AS c 
										JOIN sys.objects AS o ON o.object_id = c.object_id
										JOIN sys.types t ON c.user_type_id = t.user_type_id
										WHERE c.object_id = OBJECT_ID(@p_Table_Dimension) 
										AND c.name not in ('_created_','_modified_','_deleted_') AND type = 'U'
										AND c.name not like ('%dKey%')

	SELECT  @v_Elts_Jointure =			STRING_AGG (CAST(CONCAT('COALESCE(' , @v_Table_Temp , '.' , c.name , ',',
										CASE WHEN TYPE_NAME(c.user_type_id) like '%float%' OR TYPE_NAME(c.user_type_id) like '%int%' OR TYPE_NAME(c.user_type_id) like '%decimal%' THEN '0' else ''''''  END
										,') = COALESCE(' ,@p_Table_Dimension, '.' , c.name , ',',
										CASE WHEN TYPE_NAME(c.user_type_id) like '%float%' OR TYPE_NAME(c.user_type_id) like '%int%' OR TYPE_NAME(c.user_type_id) like '%decimal%' THEN '0' else '''''' END
										,')') AS nvarchar(MAX)), ' AND ' )
										FROM sys.columns AS c  
										JOIN sys.objects AS o ON o.object_id = c.object_id
										JOIN sys.types t ON c.user_type_id = t.user_type_id
										WHERE c.object_id = OBJECT_ID(@p_Table_Dimension) 
										AND c.name not in ('_created_','_modified_','_deleted_')
										AND c.name not like ('%dKey%') AND type = 'U'

	EXEC INSERT_LOG						@p_TYPE = 'INFO', 
										@p_LIBELLE ='Suppression de la table temporaire si elle existe', 
										@p_TRAITEMENT = @v_PROC_NAME

	IF  OBJECT_ID('tempdb..' + @v_Table_Temp) IS NOT NULL
	BEGIN
		SET @v_REQ = CONCAT('DROP TABLE' , @v_Table_Temp)
		EXEC sp_executesql @v_REQ
	END


	SELECT @v_REQ =						-- Création de la table temporaire
										'SELECT ' + @v_Liste_Champs_vue + 
										' INTO '  + @v_Table_Temp + ' FROM ' + @v_Vue_Dimension + ';'+
										-- Mise à jour des élèments supprimés
										' UPDATE ' + @p_Table_Dimension +
										' SET ' + @p_Table_Dimension + '._deleted_ = CAST(''' + CAST(@v_DATE_MAJ AS NVARCHAR) + ''' AS DATETIME2)' +
										' FROM ' + @p_Table_Dimension +
										' LEFT JOIN ' + @v_Table_Temp + ' ON ' +
										@v_Elts_Jointure +
										'WHERE ' + @v_Table_Temp + '.Code IS NULL AND ' + @p_Table_Dimension + '._deleted_ IS NULL;' +
										-- Mise à jour des élèments modifiés
										' UPDATE ' + @p_Table_Dimension +
										' SET ' + @p_Table_Dimension + '._modified_ = CAST(''' + CAST(@v_DATE_MAJ AS NVARCHAR) + ''' AS DATETIME2)' +
										' FROM ' + @p_Table_Dimension +
										' INNER JOIN ' + @v_Table_Temp + ' ON ' +
										@v_Elts_Jointure + ';' +
										--
										'INSERT INTO ' + @p_Table_Dimension + '(' + @v_Liste_Champs_table_temp + ',_created_,_modified_,_deleted_)' +
										' SELECT ' + @v_Liste_Champs_table_temp + ',CAST(''' + CAST(@v_DATE_MAJ AS NVARCHAR) + ''' AS DATETIME2)' + ', NULL, NULL FROM #' + @p_Table_Dimension + '_updated ' + 
										' LEFT OUTER JOIN ' + @p_Table_Dimension + ' ON ' + @v_Elts_Jointure +
										' WHERE ' + @p_Table_Dimension + '.Code IS NULL'
	
	BEGIN TRANSACTION;  

	BEGIN TRY 
		EXEC sp_executesql				@v_REQ
	END TRY
	BEGIN CATCH  
		IF @@TRANCOUNT > 0 
			ROLLBACK TRANSACTION; 
		
		SET @v_Message_erreur = 'Problème d''éxécution de la requête "' + CAST(ERROR_NUMBER() AS VARCHAR) + ' : ' + ERROR_MESSAGE() + '"'
		
		EXEC INSERT_LOG					@p_TYPE = 'ERROR', 
										@p_LIBELLE = @v_Message_erreur, 
										@p_TRAITEMENT = @v_PROC_NAME

		SET @v_LOG = CONCAT('Requête générée : "' , @v_REQ , '"')

		EXEC INSERT_LOG					@p_TYPE = 'ERROR', 
										@p_LIBELLE = @v_LOG, 
										@p_TRAITEMENT = @v_PROC_NAME

	END CATCH; 

	IF @@TRANCOUNT > 0 
	BEGIN
		COMMIT TRANSACTION;  

		EXEC INSERT_LOG					@p_TYPE = 'INFO', 
										@p_LIBELLE = 'Requête exécutée avec succès', 
										@p_TRAITEMENT = @v_PROC_NAME

		
		
		EXEC INSERT_LOG_TABLE_ACTION	@p_TRAITEMENT	=	@v_PROC_NAME,
										@p_DATE			=	@v_DATE_MAJ,
										@p_TYPE_ACTION	=	'DELETE',
										@p_TABLE		=	@p_Table_Dimension,
										@p_KEY			=	@v_Key_Table_Dimension
		
		EXEC INSERT_LOG_TABLE_ACTION	@p_TRAITEMENT	=	@v_PROC_NAME,
										@p_DATE			=	@v_DATE_MAJ,
										@p_TYPE_ACTION	=	'UPDATE',
										@p_TABLE		=	@p_Table_Dimension,
										@p_KEY			=	@v_Key_Table_Dimension
		
		EXEC INSERT_LOG_TABLE_ACTION	@p_TRAITEMENT	=	@v_PROC_NAME,
										@p_DATE			=	@v_DATE_MAJ,
										@p_TYPE_ACTION	=	'INSERT',
										@p_TABLE		=	@p_Table_Dimension,
										@p_KEY			=	@v_Key_Table_Dimension
	END

	--SELECT @v_REQ
