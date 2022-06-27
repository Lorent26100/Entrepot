/****** Object:  View [dbo].[V310JRX]    Committed by VersionSQL https://www.versionsql.com ******/

create view [dbo].[V310JRX] as
select *
from F310JRX, F901MSG
where F901NUM=L310901NUM
