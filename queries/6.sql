SELECT DISTINCT A.ID_Auct, A.Specifics_Auct,
(
SELECT COUNT(LOA.Lot) 
FROM LotOnAuctions LOA
WHERE A.ID_Auct=LOA.ID_Auct
) AS Count
FROM LotOnAuctions LOA, Auctions A
WHERE A.City_Auct='Minsk'
ORDER BY Count DESC;
