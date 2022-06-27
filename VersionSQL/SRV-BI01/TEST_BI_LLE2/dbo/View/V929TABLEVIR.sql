/****** Object:  View [dbo].[V929TABLEVIR]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [dbo].[V929TABLEVIR] AS
select *
from F929TABLEVIR, F901MSG
where F901NUM=L929901MSG
