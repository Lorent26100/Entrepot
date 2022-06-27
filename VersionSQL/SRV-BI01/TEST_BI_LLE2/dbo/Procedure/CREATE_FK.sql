/****** Object:  Procedure [dbo].[CREATE_FK]    Committed by VersionSQL https://www.versionsql.com ******/

-------------------------------------------------------------------------------
--	NOM PROCEDURE : CREATE_FK
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 23/06/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Création des FKs sur les tables 
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
---------------------------------------------------------------------------------------------------

CREATE         PROCEDURE [dbo].[CREATE_FK]

AS
	DECLARE @v_REQ NVARCHAR(max)
	
	
	SELECT @v_REQ = STRING_AGG(BPFK_INDEX_CREATION,';') FROM BI_PARAM_FK;
	EXEC sp_executesql @v_REQ;
