/****** Object:  Procedure [dbo].[GET_LOCPRO_DATA]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : GET_LOCPRO_DATA
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 24/05/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Récupération des données par le biais d'un serveur lié
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--			@LinkedServerName NVARCHAR(50)	: Nom du serveur lié
---------------------------------------------------------------------------------------------------

CREATE         PROCEDURE [dbo].[GET_LOCPRO_DATA]
	@p_Linked_Server_Name	NVARCHAR(50),
	@p_DataBase_Name		NVARCHAR(50)
AS
	DECLARE @v_PROC_NAME			varchar(50)		=	(SELECT OBJECT_NAME(@@PROCID));
	DECLARE @v_REQUEST				NVARCHAR(4000)	=	'';
	DECLARE @v_TABLE				NVARCHAR(200);
	DECLARE @v_LIBELLE				NVARCHAR(200);
	
	DECLARE @retval int   

	EXEC INSERT_LOG					@p_TYPE = 'INFO', 
									@p_LIBELLE ='Début éxécution de la procédure', 
									@p_TRAITEMENT = @v_PROC_NAME

	-- Récupération de la liste des tables pour lesquelles récupérées les données
	DECLARE table_cursor CURSOR  
		FOR select PARAM_VALUE from BI_PARAMETERS WHERE PARAM_TYPE = 1

	
	OPEN table_cursor  
	

	FETCH NEXT FROM table_cursor INTO @v_TABLE

	WHILE @@FETCH_STATUS = 0  
	BEGIN  
		SET @v_LIBELLE = 'Mise à jour de la table : ' + @v_TABLE		

		EXEC INSERT_LOG				@p_TYPE			=	'INFO', 
									@p_LIBELLE		=	@v_LIBELLE, 
									@p_TRAITEMENT	=	@v_PROC_NAME


		SET @v_REQUEST = N'DELETE FROM ' + @v_TABLE + '; INSERT INTO ' + @v_TABLE + ' SELECT * FROM ' + @p_Linked_Server_Name + '.' + @p_DataBase_Name + '.dbo.' + @v_TABLE ;
		
		--PRINT (@v_REQUEST)
		EXEC sp_executesql		@v_REQUEST, 
								N'@retvalOUT int OUTPUT', 
								@retvalOUT	=	@retval OUTPUT;

		-- SELECT @retval;
		FETCH NEXT FROM table_cursor INTO @v_TABLE
	END
	CLOSE table_cursor;  
	DEALLOCATE table_cursor;
