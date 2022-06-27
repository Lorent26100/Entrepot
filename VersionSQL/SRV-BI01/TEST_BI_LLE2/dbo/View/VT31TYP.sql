/****** Object:  View [dbo].[VT31TYP]    Committed by VersionSQL https://www.versionsql.com ******/

create view [dbo].[VT31TYP] as
select *
from FT31TYP, F901MSG
where F901NUM = LT31901MSG
