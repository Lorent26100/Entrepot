/****** Object:  View [dbo].[VT15TIT]    Committed by VersionSQL https://www.versionsql.com ******/

create view [dbo].[VT15TIT] as
select *
from FT15TIT, F901MSG
where F901NUM = LT15901MSG
