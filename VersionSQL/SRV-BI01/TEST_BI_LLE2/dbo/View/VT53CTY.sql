/****** Object:  View [dbo].[VT53CTY]    Committed by VersionSQL https://www.versionsql.com ******/

create view [dbo].[VT53CTY] as
select *
from FT53CTY, F901MSG
where F901NUM = LT53901MSG
