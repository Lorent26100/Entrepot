/****** Object:  View [dbo].[VT27POO]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [dbo].[VT27POO] AS
select *
from FT27POO, F901MSG
where F901NUM = LT27901MSG
