/****** Object:  Procedure [dbo].[DELETE_FK]    Committed by VersionSQL https://www.versionsql.com ******/

-------------------------------------------------------------------------------
--	NOM PROCEDURE : DELETE_FK
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 23/06/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Suppression des FKs
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
---------------------------------------------------------------------------------------------------

CREATE         PROCEDURE [dbo].[DELETE_FK]

AS
	DECLARE @v_REQ NVARCHAR(max)
	
	
	SELECT @v_REQ = STRING_AGG(BPFK_INDEX_DELETION,';') FROM BI_PARAM_FK;
	EXEC sp_executesql @v_REQ;
