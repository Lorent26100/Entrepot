/****** Object:  View [dbo].[VTAAFAMPRO]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [dbo].[VTAAFAMPRO] AS
select *
from FTAAFAMPRO, F901MSG
where F901NUM = LTAA901MSG
AND FTAAACTIF ='1'
