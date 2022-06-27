/****** Object:  View [dbo].[VT25CAT]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [dbo].[VT25CAT]  AS 
select *
from FT25CAT, F901MSG
where F901NUM = LT25901MSG
