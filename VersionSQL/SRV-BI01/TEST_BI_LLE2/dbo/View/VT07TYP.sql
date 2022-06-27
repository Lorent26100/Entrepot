/****** Object:  View [dbo].[VT07TYP]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [dbo].[VT07TYP] AS
select *
from FT07TYP, F901MSG
where F901NUM = LT07901MSG
