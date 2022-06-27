/****** Object:  View [dbo].[VT33NAT]    Committed by VersionSQL https://www.versionsql.com ******/

create view [dbo].[VT33NAT] as
select *
from FT33NAT, F901MSG
where F901NUM = LT33901MSG
