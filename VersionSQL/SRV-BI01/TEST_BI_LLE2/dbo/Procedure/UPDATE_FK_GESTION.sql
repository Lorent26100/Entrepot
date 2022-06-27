/****** Object:  Procedure [dbo].[UPDATE_FK_GESTION]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : UPDATE_FK_GESTION
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 23/06/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Mise à jour de la table BI_PARAM_FK
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--
---------------------------------------------------------------------------------------------------
CREATE   PROCEDURE [dbo].[UPDATE_FK_GESTION]
AS
	DECLARE @v_PROC_NAME				NVARCHAR(50)	=	(SELECT OBJECT_NAME(@@PROCID))
	DECLARE @v_LOG						NVARCHAR (max)	=	''

	TRUNCATE TABLE BI_PARAM_FK;

	SET @v_LOG =  'Début éxécution de la procédure'

	EXEC INSERT_LOG						@p_TYPE = 'INFO', 
										@p_LIBELLE = @v_LOG, 
										@p_TRAITEMENT = @v_PROC_NAME

	INSERT INTO BI_PARAM_FK (BPFK_INDEX_DELETION,BPFK_INDEX_CREATION)
			SELECT  'ALTER TABLE [' + ForeignKeys.ForeignTableSchema
					+ '].[' + ForeignKeys.ForeignTableName + '] DROP CONSTRAINT ['
					+ ForeignKeys.ForeignKeyName + '] '
		  , 'ALTER TABLE [' + ForeignKeys.ForeignTableSchema
					+ '].[' + ForeignKeys.ForeignTableName
					+ '] WITH CHECK ADD CONSTRAINT [' + ForeignKeys.ForeignKeyName
					+ '] FOREIGN KEY([' + ForeignKeys.ForeignTableColumn
					+ ']) REFERENCES [' + SCHEMA_NAME(sys.objects.schema_id)
					+ '].[' + sys.objects.[name] + ']([' + sys.columns.[name]
					+ ']) '
			FROM    sys.objects
			INNER JOIN sys.columns
					ON ( sys.columns.[object_id] = sys.objects.[object_id] )
			INNER JOIN ( SELECT sys.foreign_keys.[name] AS ForeignKeyName
							   ,SCHEMA_NAME(sys.objects.schema_id) AS ForeignTableSchema
							   ,sys.objects.[name] AS ForeignTableName
							   ,sys.columns.[name] AS ForeignTableColumn
							   ,sys.foreign_keys.referenced_object_id AS referenced_object_id
							   ,sys.foreign_key_columns.referenced_column_id AS referenced_column_id
						 FROM   sys.foreign_keys
						 INNER JOIN sys.foreign_key_columns
								ON ( sys.foreign_key_columns.constraint_object_id = sys.foreign_keys.[object_id] )
						 INNER JOIN sys.objects
								ON ( sys.objects.[object_id] = sys.foreign_keys.parent_object_id )
						 INNER JOIN sys.columns
								ON ( sys.columns.[object_id] = sys.objects.[object_id] )
								   AND ( sys.columns.column_id = sys.foreign_key_columns.parent_column_id )
					   ) ForeignKeys
					ON ( ForeignKeys.referenced_object_id = sys.objects.[object_id] )
					   AND ( ForeignKeys.referenced_column_id = sys.columns.column_id )
			WHERE   ( sys.objects.[type] = 'U' )
					AND ( sys.objects.[name] NOT IN ( 'sysdiagrams' ) )
					AND ForeignTableName in (select PARAM_VALUE from BI_PARAMETERS WHERE PARAM_TYPE = 1 AND PARAM_ACTIF  = 1)

	SET @v_LOG =  'Fin éxécution de la procédure'

	EXEC INSERT_LOG						@p_TYPE = 'INFO', 
										@p_LIBELLE = @v_LOG, 
										@p_TRAITEMENT = @v_PROC_NAME
					
