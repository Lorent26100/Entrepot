/****** Object:  View [dbo].[VT26ACR]    Committed by VersionSQL https://www.versionsql.com ******/

create view [dbo].[VT26ACR] as
select *
from FT26ACR, F901MSG
where F901NUM = LT26901MSG
