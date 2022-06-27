/****** Object:  View [dbo].[V101CPTA]    Committed by VersionSQL https://www.versionsql.com ******/

create view [dbo].[V101CPTA] as
select *
from F101CPTA, F901MSG
where F901NUM=L101901NUM
