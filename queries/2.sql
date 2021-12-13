SELECT A.ID_Auct, A.Specifics_Auct, 
	(
	SELECT SUM(LOA.Last_Prise) FROM LotOnAuctions LOA 
	WHERE LOA.ID_Auct=A.ID_Auct
	)
AS Profitability FROM Auctions A 
GROUP BY A.ID_Auct, A.Specifics_Auct 
ORDER BY Profitability DESC;
