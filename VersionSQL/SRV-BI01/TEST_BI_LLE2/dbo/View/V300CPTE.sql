/****** Object:  View [dbo].[V300CPTE]    Committed by VersionSQL https://www.versionsql.com ******/

create view [dbo].[V300CPTE] as
select *
from F300CPTE, F901MSG
where F901NUM=L300901NUM
