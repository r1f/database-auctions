/*
8. Вывести список покупателей с указанием количества приобретенных предметов в указанный период времени.
*/

SELECT DISTINCT P.ID_Per, P.FirstName_Per, P.LastName_Per, 
(SELECT COUNT(LOA.ID_Lot) FROM LotOnAuctions LOA
INNER JOIN Auctions A ON A.ID_Auct=LOA.ID_Auct
WHERE P.ID_Per=LOA.ID_PerCust AND A.Date_Auct BETWEEN '01.01.2010' AND '01.01.2013') AS Count
FROM Person P;