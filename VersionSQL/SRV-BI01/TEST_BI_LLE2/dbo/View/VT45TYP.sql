/****** Object:  View [dbo].[VT45TYP]    Committed by VersionSQL https://www.versionsql.com ******/

create view [dbo].[VT45TYP] as
select *
from FT45TYP, F901MSG
where F901NUM = LT45901MSG
