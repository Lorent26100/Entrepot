/****** Object:  View [dbo].[V100PRO]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [dbo].[V100PRO] AS
select *
from F100PRO, F901MSG
where F901NUM=L100901NUM
