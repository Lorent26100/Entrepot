/****** Object:  View [dbo].[VT70ACHTYP]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [dbo].[VT70ACHTYP] AS
select *
from FT70ACHTYP, F901MSG
where F901NUM = LT70901MSG
