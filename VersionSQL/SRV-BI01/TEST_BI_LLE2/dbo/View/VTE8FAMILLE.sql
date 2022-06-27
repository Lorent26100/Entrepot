/****** Object:  View [dbo].[VTE8FAMILLE]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [dbo].[VTE8FAMILLE]  AS 
select *
from FTE8FAMILLE, F901MSG
where F901NUM = LTE8901MSG
