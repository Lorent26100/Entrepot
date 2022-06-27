/****** Object:  Procedure [dbo].[UPDATE_DIM_GEN]    Committed by VersionSQL https://www.versionsql.com ******/

---------------------------------------------------------------------------------------------------
--	NOM PROCEDURE : UPDATE_DIM_GEN
--	AUTEUR : LAURENT LEBRETON
--	DATE DE CREATION : 24/05/2022
---------------------------------------------------------------------------------------------------
--	DESCRIPTION : Mise à jour des dimensions
---------------------------------------------------------------------------------------------------
--	PARAMETRES : 
--
---------------------------------------------------------------------------------------------------
CREATE       PROCEDURE [dbo].[UPDATE_DIM_GEN]
	@p_Table_Dimension	varchar(20)
AS

	--Déclarations des variables locales
	DECLARE @v_PROC_NAME			nvarchar(50)		=	'UPDATE_DIM_GEN'
	--DECLARE	@v_Table_Dimension		varchar(50)		=	'BI_DIM_VEHICULES'
	DECLARE @v_Key_Table_Dimension	varchar(50)		=	'BI_Dim_Vehicules_dKey'	
	DECLARE @v_DATE_MAJ				datetime2		=	GETDATE()
	DECLARE @v_MSG_ERROR			nvarchar(max)
	DECLARE @v_REQ					nvarchar(max);
	DECLARE @v_LOG					nvarchar(max);

	EXEC INSERT_LOG					@p_TYPE = 'INFO', 
									@p_LIBELLE ='Début éxécution de la procédure', 
									@p_TRAITEMENT = @v_PROC_NAME

	EXEC INSERT_LOG					@p_TYPE = 'INFO', 
									@p_LIBELLE ='Suppression de la table temporaire si elle existe', 
									@p_TRAITEMENT = @v_PROC_NAME
		
	-- Suppression de la table temporaire si elle existe
	SET @v_REQ	= 'IF OBJECT_ID(''tempdb..#' + @p_Table_Dimension + '_updated'') IS NOT NULL
		DROP TABLE #' + @p_Table_Dimension + '_Updated'

	exec sp_executesql		@v_REQ, 
							N'@v_LOG nvarchar(max) output', 
							@v_LOG output;

	EXEC INSERT_LOG					@p_TYPE = 'INFO', 
									@p_LIBELLE ='Création de la table temporaire', 
									@p_TRAITEMENT = @v_PROC_NAME
	
	--requête de construction de la table Dim_Vehicules
	SELECT
				F090PARC.F090KY AS Code, 
				F090PARC.K090001SOC AS societe, 
				F090PARC.K090030AGE AS Agence, 
				F090PARC.K090060MOD AS Modele, 
				F061MODINF.K061T25CAT AS Categorie, 
				VT25CAT.F901MSG AS Libelle_categorie, 
				VT25CAT.FT25ORDRE AS Ordre_Categorie, 
				F090PARC.F090SERIE AS N_de_serie, 
				F090PARC.F090DTMISC AS Date_mise_en_circulation, 
				F090PARC.F090INDT AS Date_entree, 
				F090PARC.F090OUTDTP AS Date_sortie_prevue, 
				F090PARC.F090OUTDT AS Date_sortie, 
				F090PARC.F090MOISDET AS Duree_detention, 
				F091IMMAT.F091IMMA AS Immatriculation, 
				F570MVT.K570030ARR AS Situation_agence, 
				F570MVT.K570050CLT AS Situation_client, 
				F050TIERS.F050NOM  AS Situation_client_nom, 
				CASE WHEN (V090ACHEVT.F090HT IS NULL) THEN F090PARC.F090ACHPXHT ELSE V090ACHEVT.F090HT + F090PARC.F090ACHPXHT END AS Montant_achat, 
				F090PARC.F090ACHFACDT AS Date_achat, 
				F090PARC.F090VENPXHT AS Montant_vente, 
				F090PARC.F090VENFACDT AS Date_vente, 
				F090PARC.F090KM AS Cumul_kilometrique, 
				F090PARC.K090050FOU AS Fournisseur, 
				F090PARC.K090306ANA AS Analytique, 
				VT07TYP.FT07KY AS Code_type_materiel, 
				VT07TYP.F901MSG AS Libelle_type_materiel, 
				VT27POO.FT27KY AS Code_pool_non_pool, 
				VT27POO.F901MSG AS Libelle_pool_non_pool, 
				VT26ACR.FT26KY AS Code_ACRISS, 
				VT26ACR.F901MSG AS Libelle_ACRISS, 
				VT70ACHTYP.FT70KY AS Code_type_achat, 
				VT70ACHTYP.F901MSG AS Libelle_type_achat, 
				VTE8FAMILLE.FTE8KY AS Code_famille_comptable, 
				VTE8FAMILLE.F901MSG AS Libelle_famille_comptable, 
				F090PARC.K090T07TYP AS Type_de_materiel, 
				VT58POS_F090.FT58KY AS code_position_parc,
				VT58POS_F090.F901MSG AS Libelle_position_parc, 
				VT58POS_F570.FT58KY AS Code_position_dernier_mouvement, 
				VT58POS_F570.F901MSG AS Libelle_position_dernier_mouvement, 
				F570MVT.F570DTDEP AS Date_depart_dernier_mouvement, 
				F570MVT.F570DTARR AS Date_arrivee_dernier_mouvement
	INTO		#BI_Dim_Vehicules_Updated
	FROM
				 dbo.F090PARC AS F090PARC 
				 INNER JOIN  dbo.F061MODINF AS F061MODINF ON(  F061MODINF.F061KY = F090PARC.K090061MOD )
				 LEFT OUTER JOIN  dbo.F091IMMAT AS F091IMMAT ON(  F091IMMAT.F091KY = F090PARC.K090091IMM )
				 INNER JOIN  dbo.VT25CAT AS VT25CAT ON(  VT25CAT.FT25KY = F061MODINF.K061T25CAT )
				 LEFT OUTER JOIN  dbo.F570MVT AS F570MVT ON(  F570MVT.F570KY = F090PARC.L090570DERMVT )
				 LEFT OUTER JOIN  dbo.F050TIERS AS F050TIERS ON(  F050TIERS.F050KY = F570MVT.K570050CLT )
				 LEFT OUTER JOIN  dbo.V090ACHEVT AS V090ACHEVT ON(  V090ACHEVT.F090KY = F090PARC.F090KY )
				 LEFT OUTER JOIN  dbo.VT07TYP AS VT07TYP ON(  VT07TYP.FT07KY = F090PARC.K090T07TYP )
				 LEFT OUTER JOIN  dbo.VT27POO AS VT27POO ON(  VT27POO.FT27KY = F090PARC.K090T27POO )
				 LEFT OUTER JOIN  dbo.VT26ACR AS VT26ACR ON(  VT26ACR.FT26KY = F061MODINF.K061T26ACR )
				 LEFT OUTER JOIN  dbo.VT70ACHTYP AS VT70ACHTYP ON(  VT70ACHTYP.FT70KY = F090PARC.K090T70ACHTYP )
				 LEFT OUTER JOIN  dbo.VTE8FAMILLE AS VTE8FAMILLE ON(  VTE8FAMILLE.FTE8KY = F061MODINF.K061TE8FAMCPTA )
				 LEFT OUTER JOIN  dbo.VT58POS as VT58POS_F090 ON(  VT58POS_F090.FT58KY = F090PARC.K090T58POS )
				 LEFT OUTER JOIN  dbo.VT58POS as VT58POS_F570 ON(  VT58POS_F570.FT58KY = F570MVT.K570T58POS )


	EXEC INSERT_LOG					@p_TYPE				=	'INFO', 
									@p_LIBELLE			=	'Mise à jour de la dimension (DELETE)', 
									@p_TRAITEMENT		=	@v_PROC_NAME

	UPDATE			BI_Dim_Vehicules
	SET				BI_Dim_Vehicules._deleted_	=	@v_DATE_MAJ
	FROM			BI_Dim_Vehicules 
	LEFT JOIN		#BI_Dim_Vehicules_Updated ON
					COALESCE(#BI_Dim_Vehicules_Updated.Code,'') = COALESCE(BI_Dim_Vehicules.Code,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.societe ,'') = COALESCE(BI_Dim_Vehicules.societe ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Agence ,'') = COALESCE(BI_Dim_Vehicules.Agence,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Modele ,'') = COALESCE(BI_Dim_Vehicules.Modele,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Categorie ,'') = COALESCE(BI_Dim_Vehicules.Categorie,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_categorie ,'') = COALESCE(BI_Dim_Vehicules.Libelle_categorie ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Ordre_Categorie ,'') = COALESCE(BI_Dim_Vehicules.Ordre_Categorie,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.N_de_serie ,'') = COALESCE(BI_Dim_Vehicules.N_de_serie,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_mise_en_circulation ,'') = COALESCE(BI_Dim_Vehicules.Date_mise_en_circulation,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_entree ,'') = COALESCE(BI_Dim_Vehicules.Date_entree,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_sortie_prevue ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie_prevue ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_sortie ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie,'')  
					AND COALESCE(#BI_Dim_Vehicules_Updated.Duree_detention ,0) = COALESCE(BI_Dim_Vehicules.Duree_detention ,0)
					AND COALESCE(#BI_Dim_Vehicules_Updated.Immatriculation ,'') = COALESCE(BI_Dim_Vehicules.Immatriculation ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Situation_agence ,'') = COALESCE(BI_Dim_Vehicules.Situation_agence ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Situation_client ,'') = COALESCE(BI_Dim_Vehicules.Situation_client ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Situation_client_nom ,'') = COALESCE(BI_Dim_Vehicules.Situation_client_nom ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Montant_achat ,0) = COALESCE(BI_Dim_Vehicules.Montant_achat ,0)
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_achat ,'') = COALESCE(BI_Dim_Vehicules.Date_achat ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Montant_vente ,0) = COALESCE(BI_Dim_Vehicules.Montant_vente ,0)
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_vente ,'') = COALESCE(BI_Dim_Vehicules.Date_vente ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Cumul_kilometrique ,0) = COALESCE(BI_Dim_Vehicules.Cumul_kilometrique ,0)
					AND COALESCE(#BI_Dim_Vehicules_Updated.Fournisseur ,'') = COALESCE(BI_Dim_Vehicules.Fournisseur,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Analytique ,'') = COALESCE(BI_Dim_Vehicules.Analytique,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Code_type_materiel,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_materiel ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Code_pool_non_pool ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Libelle_pool_non_pool ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Code_ACRISS,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Libelle_ACRISS ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Code_type_achat,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_achat,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Code_famille_comptable,'')  
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Libelle_famille_comptable,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Type_de_materiel ,'') = COALESCE(BI_Dim_Vehicules.Type_de_materiel,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.code_position_parc ,'') = COALESCE(BI_Dim_Vehicules.code_position_parc,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_position_parc ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_parc,'')  
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Code_position_dernier_mouvement,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_dernier_mouvement,'')  
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_depart_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_depart_dernier_mouvement,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_arrivee_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_arrivee_dernier_mouvement,'') 
					WHERE #BI_Dim_Vehicules_Updated.Code IS NULL AND BI_Dim_Vehicules._deleted_ IS NULL

	EXEC INSERT_LOG_TABLE_ACTION	@p_TRAITEMENT	=	@v_PROC_NAME,
									@p_DATE			=	@v_DATE_MAJ,
									@p_TYPE_ACTION	=	'DELETE',
									@p_TABLE		=	@p_Table_Dimension,
									@p_KEY			=	@v_Key_Table_Dimension


	EXEC INSERT_LOG					@p_TYPE			=	'INFO', 
									@p_LIBELLE		=	'Mise à jour de la dimension (UPDATE)', 
									@p_TRAITEMENT	=	@v_PROC_NAME
	
	UPDATE			BI_Dim_Vehicules
	SET				BI_Dim_Vehicules._modified_ = @v_DATE_MAJ
	FROM			BI_Dim_Vehicules 
	INNER JOIN		#BI_Dim_Vehicules_Updated ON
					#BI_Dim_Vehicules_Updated.Code = BI_Dim_Vehicules.Code 
					AND COALESCE(#BI_Dim_Vehicules_Updated.societe ,'') = COALESCE(BI_Dim_Vehicules.societe ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Agence ,'') = COALESCE(BI_Dim_Vehicules.Agence,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Modele ,'') = COALESCE(BI_Dim_Vehicules.Modele,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Categorie ,'') = COALESCE(BI_Dim_Vehicules.Categorie,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_categorie ,'') = COALESCE(BI_Dim_Vehicules.Libelle_categorie ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Ordre_Categorie ,'') = COALESCE(BI_Dim_Vehicules.Ordre_Categorie,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.N_de_serie ,'') = COALESCE(BI_Dim_Vehicules.N_de_serie,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_mise_en_circulation ,'') = COALESCE(BI_Dim_Vehicules.Date_mise_en_circulation,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_entree ,'') = COALESCE(BI_Dim_Vehicules.Date_entree,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_sortie_prevue ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie_prevue ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_sortie ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie,'')  
					AND COALESCE(#BI_Dim_Vehicules_Updated.Duree_detention ,0) = COALESCE(BI_Dim_Vehicules.Duree_detention ,0)
					AND COALESCE(#BI_Dim_Vehicules_Updated.Immatriculation ,'') = COALESCE(BI_Dim_Vehicules.Immatriculation ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Situation_agence ,'') = COALESCE(BI_Dim_Vehicules.Situation_agence ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Situation_client ,'') = COALESCE(BI_Dim_Vehicules.Situation_client ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Situation_client_nom ,'') = COALESCE(BI_Dim_Vehicules.Situation_client_nom ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Montant_achat ,0) = COALESCE(BI_Dim_Vehicules.Montant_achat ,0)
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_achat ,'') = COALESCE(BI_Dim_Vehicules.Date_achat ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Montant_vente ,0) = COALESCE(BI_Dim_Vehicules.Montant_vente ,0)
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_vente ,'') = COALESCE(BI_Dim_Vehicules.Date_vente ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Cumul_kilometrique ,0) = COALESCE(BI_Dim_Vehicules.Cumul_kilometrique ,0)
					AND COALESCE(#BI_Dim_Vehicules_Updated.Fournisseur ,'') = COALESCE(BI_Dim_Vehicules.Fournisseur,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Analytique ,'') = COALESCE(BI_Dim_Vehicules.Analytique,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Code_type_materiel,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_materiel ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Code_pool_non_pool ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Libelle_pool_non_pool ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Code_ACRISS,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Libelle_ACRISS ,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Code_type_achat,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_achat,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Code_famille_comptable,'')  
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Libelle_famille_comptable,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Type_de_materiel ,'') = COALESCE(BI_Dim_Vehicules.Type_de_materiel,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.code_position_parc ,'') = COALESCE(BI_Dim_Vehicules.code_position_parc,'')
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_position_parc ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_parc,'')  
					AND COALESCE(#BI_Dim_Vehicules_Updated.Code_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Code_position_dernier_mouvement,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_dernier_mouvement,'')  
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_depart_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_depart_dernier_mouvement,'') 
					AND COALESCE(#BI_Dim_Vehicules_Updated.Date_arrivee_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_arrivee_dernier_mouvement,'') 
	
	EXEC INSERT_LOG_TABLE_ACTION	@p_TRAITEMENT	=	@v_PROC_NAME,
									@p_DATE			=	@v_DATE_MAJ,
									@p_TYPE_ACTION	=	'UPDATE',
									@p_TABLE		=	@p_Table_Dimension,
									@p_KEY			=	@v_Key_Table_Dimension
	
	EXEC INSERT_LOG					@p_TYPE			=	'INFO', 
									@p_LIBELLE		=	'Mise à jour de la dimension (INSERT)', 
									@p_TRAITEMENT	=	@v_PROC_NAME

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
				#BI_Dim_Vehicules_Updated.Code,
				#BI_Dim_Vehicules_Updated.societe, 
				#BI_Dim_Vehicules_Updated.Agence, 
				#BI_Dim_Vehicules_Updated.Modele, 
				#BI_Dim_Vehicules_Updated.Categorie, 
				#BI_Dim_Vehicules_Updated.Libelle_categorie, 
				#BI_Dim_Vehicules_Updated.Ordre_Categorie, 
				#BI_Dim_Vehicules_Updated.N_de_serie, 
				#BI_Dim_Vehicules_Updated.Date_mise_en_circulation, 
				#BI_Dim_Vehicules_Updated.Date_entree, 
				#BI_Dim_Vehicules_Updated.Date_sortie_prevue, 
				#BI_Dim_Vehicules_Updated.Date_sortie, 
				#BI_Dim_Vehicules_Updated.Duree_detention, 
				#BI_Dim_Vehicules_Updated.Immatriculation, 
				#BI_Dim_Vehicules_Updated.Situation_agence, 
				#BI_Dim_Vehicules_Updated.Situation_client, 
				#BI_Dim_Vehicules_Updated.Situation_client_nom, 
				#BI_Dim_Vehicules_Updated.Montant_achat, 
				#BI_Dim_Vehicules_Updated.Date_achat, 
				#BI_Dim_Vehicules_Updated.Montant_vente, 
				#BI_Dim_Vehicules_Updated.Date_vente, 
				#BI_Dim_Vehicules_Updated.Cumul_kilometrique, 
				#BI_Dim_Vehicules_Updated.Fournisseur, 
				#BI_Dim_Vehicules_Updated.Analytique, 
				#BI_Dim_Vehicules_Updated.Code_type_materiel, 
				#BI_Dim_Vehicules_Updated.Libelle_type_materiel, 
				#BI_Dim_Vehicules_Updated.Code_pool_non_pool, 
				#BI_Dim_Vehicules_Updated.Libelle_pool_non_pool, 
				#BI_Dim_Vehicules_Updated.Code_ACRISS, 
				#BI_Dim_Vehicules_Updated.Libelle_ACRISS, 
				#BI_Dim_Vehicules_Updated.Code_type_achat, 
				#BI_Dim_Vehicules_Updated.Libelle_type_achat, 
				#BI_Dim_Vehicules_Updated.Code_famille_comptable, 
				#BI_Dim_Vehicules_Updated.Libelle_famille_comptable, 
				#BI_Dim_Vehicules_Updated.Type_de_materiel, 
				#BI_Dim_Vehicules_Updated.code_position_parc,
				#BI_Dim_Vehicules_Updated.Libelle_position_parc, 
				#BI_Dim_Vehicules_Updated.Code_position_dernier_mouvement, 
				#BI_Dim_Vehicules_Updated.Libelle_position_dernier_mouvement, 
				#BI_Dim_Vehicules_Updated.Date_depart_dernier_mouvement, 
				#BI_Dim_Vehicules_Updated.Date_arrivee_dernier_mouvement,
				@v_DATE_MAJ,
				NULL,
				NULL
	FROM		#BI_Dim_Vehicules_Updated LEFT OUTER JOIN BI_Dim_Vehicules ON
				#BI_Dim_Vehicules_Updated.Code = BI_Dim_Vehicules.Code 
				AND COALESCE(#BI_Dim_Vehicules_Updated.societe ,'') = COALESCE(BI_Dim_Vehicules.societe ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Agence ,'') = COALESCE(BI_Dim_Vehicules.Agence,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Modele ,'') = COALESCE(BI_Dim_Vehicules.Modele,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Categorie ,'') = COALESCE(BI_Dim_Vehicules.Categorie,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_categorie ,'') = COALESCE(BI_Dim_Vehicules.Libelle_categorie ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Ordre_Categorie ,'') = COALESCE(BI_Dim_Vehicules.Ordre_Categorie,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.N_de_serie ,'') = COALESCE(BI_Dim_Vehicules.N_de_serie,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Date_mise_en_circulation ,'') = COALESCE(BI_Dim_Vehicules.Date_mise_en_circulation,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Date_entree ,'') = COALESCE(BI_Dim_Vehicules.Date_entree,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Date_sortie_prevue ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie_prevue ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Date_sortie ,'') = COALESCE(BI_Dim_Vehicules.Date_sortie,'')  
				AND COALESCE(#BI_Dim_Vehicules_Updated.Duree_detention ,0) = COALESCE(BI_Dim_Vehicules.Duree_detention ,0)
				AND COALESCE(#BI_Dim_Vehicules_Updated.Immatriculation ,'') = COALESCE(BI_Dim_Vehicules.Immatriculation ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Situation_agence ,'') = COALESCE(BI_Dim_Vehicules.Situation_agence ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Situation_client ,'') = COALESCE(BI_Dim_Vehicules.Situation_client ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Situation_client_nom ,'') = COALESCE(BI_Dim_Vehicules.Situation_client_nom ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Montant_achat ,0) = COALESCE(BI_Dim_Vehicules.Montant_achat ,0)
				AND COALESCE(#BI_Dim_Vehicules_Updated.Date_achat ,'') = COALESCE(BI_Dim_Vehicules.Date_achat ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Montant_vente ,0) = COALESCE(BI_Dim_Vehicules.Montant_vente ,0)
				AND COALESCE(#BI_Dim_Vehicules_Updated.Date_vente ,'') = COALESCE(BI_Dim_Vehicules.Date_vente ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Cumul_kilometrique ,0) = COALESCE(BI_Dim_Vehicules.Cumul_kilometrique ,0)
				AND COALESCE(#BI_Dim_Vehicules_Updated.Fournisseur ,'') = COALESCE(BI_Dim_Vehicules.Fournisseur,'') 
				AND COALESCE(#BI_Dim_Vehicules_Updated.Analytique ,'') = COALESCE(BI_Dim_Vehicules.Analytique,'') 
				AND COALESCE(#BI_Dim_Vehicules_Updated.Code_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Code_type_materiel,'') 
				AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_type_materiel ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_materiel ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Code_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Code_pool_non_pool ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_pool_non_pool ,'') = COALESCE(BI_Dim_Vehicules.Libelle_pool_non_pool ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Code_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Code_ACRISS,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_ACRISS ,'') = COALESCE(BI_Dim_Vehicules.Libelle_ACRISS ,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Code_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Code_type_achat,'') 
				AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_type_achat ,'') = COALESCE(BI_Dim_Vehicules.Libelle_type_achat,'') 
				AND COALESCE(#BI_Dim_Vehicules_Updated.Code_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Code_famille_comptable,'')  
				AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_famille_comptable ,'') = COALESCE(BI_Dim_Vehicules.Libelle_famille_comptable,'') 
				AND COALESCE(#BI_Dim_Vehicules_Updated.Type_de_materiel ,'') = COALESCE(BI_Dim_Vehicules.Type_de_materiel,'') 
				AND COALESCE(#BI_Dim_Vehicules_Updated.code_position_parc ,'') = COALESCE(BI_Dim_Vehicules.code_position_parc,'')
				AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_position_parc ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_parc,'')  
				AND COALESCE(#BI_Dim_Vehicules_Updated.Code_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Code_position_dernier_mouvement,'') 
				AND COALESCE(#BI_Dim_Vehicules_Updated.Libelle_position_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Libelle_position_dernier_mouvement,'')  
				AND COALESCE(#BI_Dim_Vehicules_Updated.Date_depart_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_depart_dernier_mouvement,'') 
				AND COALESCE(#BI_Dim_Vehicules_Updated.Date_arrivee_dernier_mouvement ,'') = COALESCE(BI_Dim_Vehicules.Date_arrivee_dernier_mouvement,'') 
	WHERE		BI_Dim_Vehicules.Code IS NULL

	EXEC INSERT_LOG_TABLE_ACTION	@p_TRAITEMENT	=	@v_PROC_NAME,
									@p_DATE			=	@v_DATE_MAJ,
									@p_TYPE_ACTION	=	'INSERT',
									@p_TABLE		=	@p_Table_Dimension,
									@p_KEY			=	@v_Key_Table_Dimension
