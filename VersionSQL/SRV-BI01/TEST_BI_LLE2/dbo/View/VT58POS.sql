/****** Object:  View [dbo].[VT58POS]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [dbo].[VT58POS]  AS 
select *
from FT58POS, F901MSG
where F901NUM = LT58901MSG
