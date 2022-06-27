/****** Object:  Function [dbo].[concatenation]    Committed by VersionSQL https://www.versionsql.com ******/

create function [dbo].[concatenation](@firstWord varchar, @secondWord varchar,@separator varchar) 
returns varchar as
BEGIN
DECLARE
	@word varchar;
	select @word = @firstWord + @separator + @secondWord;
	return @word;
END;
