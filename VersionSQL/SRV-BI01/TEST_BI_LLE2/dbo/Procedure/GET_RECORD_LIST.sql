/****** Object:  Procedure [dbo].[GET_RECORD_LIST]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : GET_RECORD_LIST
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 24/05/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Retourne la liste des enregistrements traitées 
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--		@p_ACTION_TYPE	nvarchar(20) : 'UPDATE', 'INSERT', DELETE'	
--		@p_TABLE		nvarchar(50) : Table sur laquelle l'action est effectuée
--		@p_KEY			nvarchar(50) : Clé de la table
--		@p_DATE			nvarchar(25) :	Date de traitements des enregistrements	
--		@p_RECORD		nvarchar(max) :	Liste des enregistrements traités	
---------------------------------------------------------------------------------------------------
CREATE   PROCEDURE [dbo].[GET_RECORD_LIST]  
	@p_ACTION_TYPE	nvarchar(20),
	@p_TABLE		nvarchar(50),
	@p_KEY			nvarchar(50),
	@p_DATE			nvarchar(25),
	@p_RECORD		nvarchar(max)	OUTPUT
AS  
	DECLARE @v_REQ nvarchar(max);

	SET @v_REQ	=	'SELECT @p_RECORD = STRING_AGG (CONVERT(NVARCHAR(max),' + @p_KEY + '), '', '') from  ' + @p_TABLE +' WHERE ';
	SET @v_REQ	=	@v_REQ + CASE @p_ACTION_TYPE WHEN  'INSERT' THEN '_created_' WHEN 'UPDATE' THEN '_modified_' WHEN 'DELETE' THEN '_deleted_' END;
	SET @v_REQ	=	@v_REQ + ' = CAST(''' + @p_DATE + ''' AS DATETIME2)';

	exec sp_executesql		@v_REQ, 
							N'@p_RECORD nvarchar(max) output', 
							@p_RECORD output;
