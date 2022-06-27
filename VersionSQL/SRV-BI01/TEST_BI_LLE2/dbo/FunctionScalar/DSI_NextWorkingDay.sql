/****** Object:  Function [dbo].[DSI_NextWorkingDay]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE function [dbo].[DSI_NextWorkingDay](@jour date) returns date as
BEGIN
declare @nextday date=dateadd(day,1,@jour);
if (DATENAME(dw,@nextday) in ('samedi','dimanche') or [dbo].[jourFerie](@nextday)=1) return [dbo].[DSI_NextWorkingDay](@nextday);
return @nextday;
END
