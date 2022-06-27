/****** Object:  Procedure [dbo].[UPDATE_DIM_VEHICULES2]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : UPDATE_DIM_VEHICULES
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 24/05/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Mise à jour de la dimension DIM_VEHICULES
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--
---------------------------------------------------------------------------------------------------
CREATE     PROCEDURE [dbo].[UPDATE_DIM_VEHICULES2]
AS

	--Déclarations des variables locales
	DECLARE @v_PROC_NAME			varchar(50)		=	'UPDATE_DIM_VEHICULES'
	DECLARE	@v_Table_Dimension		varchar(50)		=	'BI_DIM_VEHICULES'
	DECLARE @v_Key_Table_Dimension	varchar(50)		=	'BI_Dim_Vehicules_dKey'	
	DECLARE @v_DATE_MAJ				datetime2		=	GETDATE()
	DECLARE @v_MSG_ERROR			varchar(max)


	EXEC INSERT_LOG					@p_TYPE = 'INFO', 
									@p_LIBELLE ='Début éxécution de la procédure', 
									@p_TRAITEMENT = @v_PROC_NAME

	EXEC INSERT_LOG					@p_TYPE = 'INFO', 
									@p_LIBELLE ='Suppression de la table temporaire si elle existe', 
									@p_TRAITEMENT = @v_PROC_NAME
		
	-- Suppression de la table temporaire si elle existe
	IF OBJECT_ID('tempdb..#BI_Dim_Vehicules_Updated') IS NOT NULL
		DROP TABLE #BI_Dim_Vehicules_Updated

	EXEC INSERT_LOG					@p_TYPE = 'INFO', 
									@p_LIBELLE ='Création de la table temporaire', 
									@p_TRAITEMENT = @v_PROC_NAME
	
	EXEC INSERT_LOG					@p_TYPE = 'INFO', 
									@p_LIBELLE ='Mise à jour de la dimension (UPDATE)', 
									@p_TRAITEMENT = @v_PROC_NAME

	UPDATE BI_Dim_Vehicules SET BI_Dim_Vehicules._modified_ = @v_DATE_MAJ
	FROM  BI_Dim_Vehicules INNER JOIN v_BI_Dim_Vehicules ON
			v_BI_Dim_Vehicules.Code = BI_Dim_Vehicules.Code 
			AND COALESCE(v_BI_Dim_Vehicules.societe ,'') = COALESCE(BI_Dim_Vehicules.societe ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Agence ,'') = COALESCE(BI_Dim_Vehicules.Agence,'')
			AND COALESCE(v_BI_Dim_Vehicules.Modele ,'') = COALESCE(BI_Dim_Vehicules.Modele,'')
			AND COALESCE(v_BI_Dim_Vehicules.Categorie ,'') = COALESCE(BI_Dim_Vehicules.Categorie,'')
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_categorie ,'') = COALESCE(BI_Dim_Vehicules.Libelle_categorie ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Ordre_Categorie ,'') = COALESCE(BI_Dim_Vehicules.Ordre_Categorie,'')
			AND COALESCE(v_BI_Dim_Vehicules.N_de_serie ,'') = COALESCE(BI_Dim_Vehicules.N_de_serie,'')
			AND COALESCE(v_BI_Dim_Vehicules.Date_mise_en_circulation ,'') = COALESCE(BI_Dim_Vehicules.Date_mise_en_circulation,'')
			AND COALESCE(v_BI_Dim_Vehicules.Date_entree ,'') = COALESCE(BI_Dim_Vehicules.Date_entree,'')
			AND COALESCE(v_BI_Dim_Vehicules.Date_sortie_prevue ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie_prevue ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Date_sortie ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie,'')  
			AND COALESCE(v_BI_Dim_Vehicules.Duree_detention ,0) = COALESCE(BI_Dim_Vehicules.Duree_detention ,0)
			AND COALESCE(v_BI_Dim_Vehicules.Immatriculation ,'') = COALESCE(BI_Dim_Vehicules.Immatriculation ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Situation_agence ,'') = COALESCE(BI_Dim_Vehicules.Situation_agence ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Situation_client ,'') = COALESCE(BI_Dim_Vehicules.Situation_client ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Situation_client_nom ,'') = COALESCE(BI_Dim_Vehicules.Situation_client_nom ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Montant_achat ,0) = COALESCE(BI_Dim_Vehicules.Montant_achat ,0)
			AND COALESCE(v_BI_Dim_Vehicules.Date_achat ,'') = COALESCE(BI_Dim_Vehicules.Date_achat ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Montant_vente ,0) = COALESCE(BI_Dim_Vehicules.Montant_vente ,0)
			AND COALESCE(v_BI_Dim_Vehicules.Date_vente ,'') = COALESCE(BI_Dim_Vehicules.Date_vente ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Cumul_kilometrique ,0) = COALESCE(BI_Dim_Vehicules.Cumul_kilometrique ,0)
			AND COALESCE(v_BI_Dim_Vehicules.Fournisseur ,'') = COALESCE(BI_Dim_Vehicules.Fournisseur,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Analytique ,'') = COALESCE(BI_Dim_Vehicules.Analytique,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Code_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Code_type_materiel,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_materiel ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Code_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Code_pool_non_pool ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Libelle_pool_non_pool ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Code_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Code_ACRISS,'')
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Libelle_ACRISS ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Code_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Code_type_achat,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_achat,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Code_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Code_famille_comptable,'')  
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Libelle_famille_comptable,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Type_de_materiel ,'') = COALESCE(BI_Dim_Vehicules.Type_de_materiel,'') 
			AND COALESCE(v_BI_Dim_Vehicules.code_position_parc ,'') = COALESCE(BI_Dim_Vehicules.code_position_parc,'')
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_position_parc ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_parc,'')  
			AND COALESCE(v_BI_Dim_Vehicules.Code_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Code_position_dernier_mouvement,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_dernier_mouvement,'')  
			AND COALESCE(v_BI_Dim_Vehicules.Date_depart_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_depart_dernier_mouvement,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Date_arrivee_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_arrivee_dernier_mouvement,'') 

			EXEC INSERT_LOG_TABLE_ACTION	@p_TRAITEMENT	=	@v_PROC_NAME,
							@p_DATE			=	@v_DATE_MAJ,
							@p_TYPE_ACTION	=	'UPDATE',
							@p_TABLE		=	@v_Table_Dimension,
							@p_KEY			=	@v_Key_Table_Dimension
	/*END TRY  
	BEGIN CATCH  
		SELECT @v_MSG_ERROR = CAST(ERROR_NUMBER() AS VARCHAR) + ' : ' + ERROR_MESSAGE()

		EXEC [dbo].[INSERT_LOG]				@p_TYPE			=	'ERROR', 
											@p_LIBELLE		=	@v_MSG_ERROR, 
											@p_TRAITEMENT	=	@v_PROC_NAME
	END CATCH;  */



	EXEC INSERT_LOG					@p_TYPE = 'INFO', 
									@p_LIBELLE ='Mise à jour de la dimension (DELETE)', 
									@p_TRAITEMENT = @v_PROC_NAME

	UPDATE BI_Dim_Vehicules
	SET BI_Dim_Vehicules._deleted_ = @v_DATE_MAJ
	FROM  BI_Dim_Vehicules LEFT JOIN v_BI_Dim_Vehicules ON
			v_BI_Dim_Vehicules.Code = BI_Dim_Vehicules.Code 
			AND COALESCE(v_BI_Dim_Vehicules.societe ,'') = COALESCE(BI_Dim_Vehicules.societe ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Agence ,'') = COALESCE(BI_Dim_Vehicules.Agence,'')
			AND COALESCE(v_BI_Dim_Vehicules.Modele ,'') = COALESCE(BI_Dim_Vehicules.Modele,'')
			AND COALESCE(v_BI_Dim_Vehicules.Categorie ,'') = COALESCE(BI_Dim_Vehicules.Categorie,'')
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_categorie ,'') = COALESCE(BI_Dim_Vehicules.Libelle_categorie ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Ordre_Categorie ,'') = COALESCE(BI_Dim_Vehicules.Ordre_Categorie,'')
			AND COALESCE(v_BI_Dim_Vehicules.N_de_serie ,'') = COALESCE(BI_Dim_Vehicules.N_de_serie,'')
			AND COALESCE(v_BI_Dim_Vehicules.Date_mise_en_circulation ,'') = COALESCE(BI_Dim_Vehicules.Date_mise_en_circulation,'')
			AND COALESCE(v_BI_Dim_Vehicules.Date_entree ,'') = COALESCE(BI_Dim_Vehicules.Date_entree,'')
			AND COALESCE(v_BI_Dim_Vehicules.Date_sortie_prevue ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie_prevue ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Date_sortie ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie,'')  
			AND COALESCE(v_BI_Dim_Vehicules.Duree_detention ,0) = COALESCE(BI_Dim_Vehicules.Duree_detention ,0)
			AND COALESCE(v_BI_Dim_Vehicules.Immatriculation ,'') = COALESCE(BI_Dim_Vehicules.Immatriculation ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Situation_agence ,'') = COALESCE(BI_Dim_Vehicules.Situation_agence ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Situation_client ,'') = COALESCE(BI_Dim_Vehicules.Situation_client ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Situation_client_nom ,'') = COALESCE(BI_Dim_Vehicules.Situation_client_nom ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Montant_achat ,0) = COALESCE(BI_Dim_Vehicules.Montant_achat ,0)
			AND COALESCE(v_BI_Dim_Vehicules.Date_achat ,'') = COALESCE(BI_Dim_Vehicules.Date_achat ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Montant_vente ,0) = COALESCE(BI_Dim_Vehicules.Montant_vente ,0)
			AND COALESCE(v_BI_Dim_Vehicules.Date_vente ,'') = COALESCE(BI_Dim_Vehicules.Date_vente ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Cumul_kilometrique ,0) = COALESCE(BI_Dim_Vehicules.Cumul_kilometrique ,0)
			AND COALESCE(v_BI_Dim_Vehicules.Fournisseur ,'') = COALESCE(BI_Dim_Vehicules.Fournisseur,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Analytique ,'') = COALESCE(BI_Dim_Vehicules.Analytique,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Code_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Code_type_materiel,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_materiel ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Code_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Code_pool_non_pool ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Libelle_pool_non_pool ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Code_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Code_ACRISS,'')
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Libelle_ACRISS ,'')
			AND COALESCE(v_BI_Dim_Vehicules.Code_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Code_type_achat,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_achat,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Code_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Code_famille_comptable,'')  
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Libelle_famille_comptable,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Type_de_materiel ,'') = COALESCE(BI_Dim_Vehicules.Type_de_materiel,'') 
			AND COALESCE(v_BI_Dim_Vehicules.code_position_parc ,'') = COALESCE(BI_Dim_Vehicules.code_position_parc,'')
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_position_parc ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_parc,'')  
			AND COALESCE(v_BI_Dim_Vehicules.Code_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Code_position_dernier_mouvement,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Libelle_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_dernier_mouvement,'')  
			AND COALESCE(v_BI_Dim_Vehicules.Date_depart_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_depart_dernier_mouvement,'') 
			AND COALESCE(v_BI_Dim_Vehicules.Date_arrivee_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_arrivee_dernier_mouvement,'') 
			WHERE v_BI_Dim_Vehicules.Code IS NULL AND BI_Dim_Vehicules._deleted_ IS NULL

	EXEC INSERT_LOG_TABLE_ACTION	@p_TRAITEMENT	=	@v_PROC_NAME,
									@p_DATE			=	@v_DATE_MAJ,
									@p_TYPE_ACTION	=	'DELETE',
									@p_TABLE		=	@v_Table_Dimension,
									@p_KEY			=	@v_Key_Table_Dimension

	EXEC INSERT_LOG					@p_TYPE = 'INFO', 
									@p_LIBELLE ='Mise à jour de la dimension (INSERT)', 
									@p_TRAITEMENT = @v_PROC_NAME

	-- Recherche des enregistrements qui n'existent pas encore
	INSERT INTO [BI_Dim_Vehicules] 
		(
			Code, societe, Agence, Modele, Categorie, Libelle_categorie, Ordre_Categorie, N_de_serie, Date_mise_en_circulation, 
			Date_entree,Date_sortie_prevue,Date_sortie,  Duree_detention, Immatriculation, Situation_agence, Situation_client, Situation_client_nom, Montant_achat, Date_achat, Montant_vente,
			Date_vente,Cumul_kilometrique, Fournisseur,Analytique,Code_type_materiel,Libelle_type_materiel,
			Code_pool_non_pool, Libelle_pool_non_pool, Code_ACRISS, Libelle_ACRISS, Code_type_achat, Libelle_type_achat, Code_famille_comptable, 
			Libelle_famille_comptable, Type_de_materiel, code_position_parc, Libelle_position_parc, Code_position_dernier_mouvement, Libelle_position_dernier_mouvement, 
			Date_depart_dernier_mouvement, Date_arrivee_dernier_mouvement, _created_, _modified_, _deleted_
		) 
	SELECT 	
		v_BI_Dim_Vehicules.Code,
		v_BI_Dim_Vehicules.societe, 
		v_BI_Dim_Vehicules.Agence, 
		v_BI_Dim_Vehicules.Modele, 
		v_BI_Dim_Vehicules.Categorie, 
		v_BI_Dim_Vehicules.Libelle_categorie, 
		v_BI_Dim_Vehicules.Ordre_Categorie, 
		v_BI_Dim_Vehicules.N_de_serie, 
		v_BI_Dim_Vehicules.Date_mise_en_circulation, 
		v_BI_Dim_Vehicules.Date_entree, 
		v_BI_Dim_Vehicules.Date_sortie_prevue, 
		v_BI_Dim_Vehicules.Date_sortie, 
		v_BI_Dim_Vehicules.Duree_detention, 
		v_BI_Dim_Vehicules.Immatriculation, 
		v_BI_Dim_Vehicules.Situation_agence, 
		v_BI_Dim_Vehicules.Situation_client, 
		v_BI_Dim_Vehicules.Situation_client_nom, 
		v_BI_Dim_Vehicules.Montant_achat, 
		v_BI_Dim_Vehicules.Date_achat, 
		v_BI_Dim_Vehicules.Montant_vente, 
		v_BI_Dim_Vehicules.Date_vente, 
		v_BI_Dim_Vehicules.Cumul_kilometrique, 
		v_BI_Dim_Vehicules.Fournisseur, 
		v_BI_Dim_Vehicules.Analytique, 
		v_BI_Dim_Vehicules.Code_type_materiel, 
		v_BI_Dim_Vehicules.Libelle_type_materiel, 
		v_BI_Dim_Vehicules.Code_pool_non_pool, 
		v_BI_Dim_Vehicules.Libelle_pool_non_pool, 
		v_BI_Dim_Vehicules.Code_ACRISS, 
		v_BI_Dim_Vehicules.Libelle_ACRISS, 
		v_BI_Dim_Vehicules.Code_type_achat, 
		v_BI_Dim_Vehicules.Libelle_type_achat, 
		v_BI_Dim_Vehicules.Code_famille_comptable, 
		v_BI_Dim_Vehicules.Libelle_famille_comptable, 
		v_BI_Dim_Vehicules.Type_de_materiel, 
		v_BI_Dim_Vehicules.code_position_parc,
		v_BI_Dim_Vehicules.Libelle_position_parc, 
		v_BI_Dim_Vehicules.Code_position_dernier_mouvement, 
		v_BI_Dim_Vehicules.Libelle_position_dernier_mouvement, 
		v_BI_Dim_Vehicules.Date_depart_dernier_mouvement, 
		v_BI_Dim_Vehicules.Date_arrivee_dernier_mouvement,
		@v_DATE_MAJ,
		NULL,
		NULL
	FROM  v_BI_Dim_Vehicules LEFT OUTER JOIN BI_Dim_Vehicules ON
		v_BI_Dim_Vehicules.Code = BI_Dim_Vehicules.Code 
		AND COALESCE(v_BI_Dim_Vehicules.societe ,'') = COALESCE(BI_Dim_Vehicules.societe ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Agence ,'') = COALESCE(BI_Dim_Vehicules.Agence,'')
		AND COALESCE(v_BI_Dim_Vehicules.Modele ,'') = COALESCE(BI_Dim_Vehicules.Modele,'')
		AND COALESCE(v_BI_Dim_Vehicules.Categorie ,'') = COALESCE(BI_Dim_Vehicules.Categorie,'')
		AND COALESCE(v_BI_Dim_Vehicules.Libelle_categorie ,'') = COALESCE(BI_Dim_Vehicules.Libelle_categorie ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Ordre_Categorie ,'') = COALESCE(BI_Dim_Vehicules.Ordre_Categorie,'')
		AND COALESCE(v_BI_Dim_Vehicules.N_de_serie ,'') = COALESCE(BI_Dim_Vehicules.N_de_serie,'')
		AND COALESCE(v_BI_Dim_Vehicules.Date_mise_en_circulation ,'') = COALESCE(BI_Dim_Vehicules.Date_mise_en_circulation,'')
		AND COALESCE(v_BI_Dim_Vehicules.Date_entree ,'') = COALESCE(BI_Dim_Vehicules.Date_entree,'')
		AND COALESCE(v_BI_Dim_Vehicules.Date_sortie_prevue ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie_prevue ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Date_sortie ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie,'')  
		AND COALESCE(v_BI_Dim_Vehicules.Duree_detention ,0) = COALESCE(BI_Dim_Vehicules.Duree_detention ,0)
		AND COALESCE(v_BI_Dim_Vehicules.Immatriculation ,'') = COALESCE(BI_Dim_Vehicules.Immatriculation ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Situation_agence ,'') = COALESCE(BI_Dim_Vehicules.Situation_agence ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Situation_client ,'') = COALESCE(BI_Dim_Vehicules.Situation_client ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Situation_client_nom ,'') = COALESCE(BI_Dim_Vehicules.Situation_client_nom ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Montant_achat ,0) = COALESCE(BI_Dim_Vehicules.Montant_achat ,0)
		AND COALESCE(v_BI_Dim_Vehicules.Date_achat ,'') = COALESCE(BI_Dim_Vehicules.Date_achat ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Montant_vente ,0) = COALESCE(BI_Dim_Vehicules.Montant_vente ,0)
		AND COALESCE(v_BI_Dim_Vehicules.Date_vente ,'') = COALESCE(BI_Dim_Vehicules.Date_vente ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Cumul_kilometrique ,0) = COALESCE(BI_Dim_Vehicules.Cumul_kilometrique ,0)
		AND COALESCE(v_BI_Dim_Vehicules.Fournisseur ,'') = COALESCE(BI_Dim_Vehicules.Fournisseur,'') 
		AND COALESCE(v_BI_Dim_Vehicules.Analytique ,'') = COALESCE(BI_Dim_Vehicules.Analytique,'') 
		AND COALESCE(v_BI_Dim_Vehicules.Code_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Code_type_materiel,'') 
		AND COALESCE(v_BI_Dim_Vehicules.Libelle_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_materiel ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Code_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Code_pool_non_pool ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Libelle_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Libelle_pool_non_pool ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Code_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Code_ACRISS,'')
		AND COALESCE(v_BI_Dim_Vehicules.Libelle_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Libelle_ACRISS ,'')
		AND COALESCE(v_BI_Dim_Vehicules.Code_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Code_type_achat,'') 
		AND COALESCE(v_BI_Dim_Vehicules.Libelle_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_achat,'') 
		AND COALESCE(v_BI_Dim_Vehicules.Code_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Code_famille_comptable,'')  
		AND COALESCE(v_BI_Dim_Vehicules.Libelle_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Libelle_famille_comptable,'') 
		AND COALESCE(v_BI_Dim_Vehicules.Type_de_materiel ,'') = COALESCE(BI_Dim_Vehicules.Type_de_materiel,'') 
		AND COALESCE(v_BI_Dim_Vehicules.code_position_parc ,'') = COALESCE(BI_Dim_Vehicules.code_position_parc,'')
		AND COALESCE(v_BI_Dim_Vehicules.Libelle_position_parc ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_parc,'')  
		AND COALESCE(v_BI_Dim_Vehicules.Code_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Code_position_dernier_mouvement,'') 
		AND COALESCE(v_BI_Dim_Vehicules.Libelle_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_dernier_mouvement,'')  
		AND COALESCE(v_BI_Dim_Vehicules.Date_depart_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_depart_dernier_mouvement,'') 
		AND COALESCE(v_BI_Dim_Vehicules.Date_arrivee_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_arrivee_dernier_mouvement,'') 
		WHERE BI_Dim_Vehicules.Code IS NULL

	EXEC INSERT_LOG_TABLE_ACTION	@p_TRAITEMENT	=	@v_PROC_NAME,
									@p_DATE			=	@v_DATE_MAJ,
									@p_TYPE_ACTION	=	'INSERT',
									@p_TABLE		=	@v_Table_Dimension,
									@p_KEY			=	@v_Key_Table_Dimension
