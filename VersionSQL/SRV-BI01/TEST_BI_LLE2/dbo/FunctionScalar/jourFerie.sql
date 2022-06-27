/****** Object:  Function [dbo].[jourFerie]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE function [dbo].[jourFerie](@jour date) returns tinyint as
begin
declare @mois tinyint;
declare @numeroJour tinyint;
declare @ferie tinyint =0; --Pas férié par défaut
declare @paques date;
declare @ascension date;
declare @pentecote date;
--Est un jour ferie fixe?
set @mois=datepart(mm,@jour);
set @numeroJour=datepart(dd, @jour);
if (@mois=1 AND @numeroJour=1 and DATEPART(weekday, @jour) not in (6,7)) set @ferie=1; --1er janvier
if (@mois=5 AND (@numeroJour=1 OR @numeroJour=8) AND DATEPART(weekday, @jour) not in (6,7)) set @ferie=1; -- 1er ou 8 mai
if (@mois=7 AND @numeroJour=14 AND DATEPART(weekday, @jour) not in (6,7)) set @ferie=1; -- 14 juillet
if (@mois=8 AND @numeroJour=15 AND DATEPART(weekday, @jour) not in (6,7)) set @ferie=1; -- 15 aout
if (@mois=11 AND (@numeroJour=1 OR @numeroJour=11) AND DATEPART(weekday, @jour) not in (6,7)) set @ferie=1; -- 1er ou 11 novembre
if (@mois=12 AND @numeroJour=25 AND DATEPART(weekday, @jour) not in (6,7)) set @ferie=1; -- 25 décembre
-- Jour ferie variable?
set @paques=dbo.dateDePaques(datepart(yy, @jour));
set @ascension=dateadd(dd,39,@paques);
set @pentecote=dateadd(dd,49,@paques);
if (@jour=@paques or @jour=dateadd(dd,1,@paques)) AND DATEPART(weekday, @jour) not in (6,7) set @ferie=1;
if (@jour=@ascension AND DATEPART(weekday, @jour) not in (6,7)) set @ferie=1;
if (@jour=@pentecote or @jour=dateadd(dd,1,@pentecote)) AND DATEPART(weekday, @jour) not in (6,7) set @ferie=1;
return @ferie;
end;
