/****** Object:  Function [dbo].[dateDePaques]    Committed by VersionSQL https://www.versionsql.com ******/

Create function [dbo].[dateDePaques](@annee int) returns date as
BEGIN
DECLARE @G int, @C int,@C_4 int;
DECLARE @E int,@H int, @K int;
DECLARE @P int,@Q int, @I int;
DECLARE @B int,@J1 int, @J2 int;
DECLARE @R int;
DECLARE @jourDePaque date;
set @G=@annee%19;
set @C=@annee/100;
set @C_4=@C/4;
set @E=(8*@c+13)/25;
set @H=(19*@g+ @C-@C_4-@E+15)%30;
IF (@H=29) set @H=@H-1;
ELSE IF (@H=28 AND @G>10) set @H=@H-1;
set @K=@H/28;
set @P=29/(@H+1);
set @Q=(21-@G)/11;
set @I=(@K*@P*@Q-1)*@K+@H;
set @B=@annee/4+@annee;
set @J1=@B+@I+2+@C_4-@C;
set @J2=@J1%7;
set @R=28+@I-@J2;
set @jourDePaque='01/03/'+convert(char(4),@annee);
set @jourDePaque=dateadd(dd,@r-1,@jourDePaque);
return @jourDePaque;
END;
