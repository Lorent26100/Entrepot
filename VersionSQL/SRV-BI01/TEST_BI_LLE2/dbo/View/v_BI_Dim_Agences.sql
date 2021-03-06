/****** Object:  View [dbo].[v_BI_Dim_Agences]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE   VIEW [dbo].[v_BI_Dim_Agences] AS   SELECT
	  ROW_NUMBER() OVER(ORDER BY F030KY DESC) AS BI_Dim_Agences_dKey,
	  F030AGE.F030KY AS Code, 
	  F030AGE.F030LIB AS Libelle, 
	  F030AGE.F030ANA AS Analytique, 
	  F03XSECT.K03X033SECT AS Secteur
	  FROM
	   F033SECT INNER JOIN  F03XSECT ON(  F03XSECT.K03X033SECT = F033SECT.F033KY ) AND F033SECT.K033T88NAT = 'BI'
				RIGHT  OUTER JOIN F030AGE ON  F030AGE.F030KY = F03XSECT.K03X033SECT
