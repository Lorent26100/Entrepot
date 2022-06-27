/****** Object:  Procedure [dbo].[INSERT_LOG]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : INSERT_LOG
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 24/05/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Insertion d'une entrée de Log dans la table BI_LOG
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--		@p_TYPE			nvarchar(10)	:	Type de LOG ('ERROR', 'INFO', 'DEBUG')	
--		@p_LIBELLE		nvarchar(MAX)	:	Message à inscrire dans la table de LOG
--		@p_TRAITEMENT	nvarchar(50)	:	Procédure qui inscrit le LOG
---------------------------------------------------------------------------------------------------
CREATE   PROCEDURE [dbo].[INSERT_LOG] 
	@p_TYPE			nvarchar(10),
	@p_LIBELLE		nvarchar(MAX),
	@p_TRAITEMENT	nvarchar(50) 
AS
BEGIN
	INSERT INTO BI_LOG	
				(
						BI_LOG_DATETIME, 
						BI_LOG_TYPE, 
						BI_LOG_LIBELLE,
						BI_LOG_TRAITEMENT
				) 
				VALUES 
				(
						GETDATE(), 
						@p_TYPE, 
						@p_LIBELLE, 
						@p_TRAITEMENT
				)
END
