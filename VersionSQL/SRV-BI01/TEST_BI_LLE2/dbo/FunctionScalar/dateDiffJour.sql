/****** Object:  Function [dbo].[dateDiffJour]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE   FUNCTION [dbo].[dateDiffJour](@dateDeb datetime, @dateFin datetime)
RETURNS INTEGER AS
BEGIN
DECLARE
    @minDiff INTEGER;
	select @minDiff = DATEDIFF(D,@dateDeb, @dateFin);
	return @minDiff;
END;
