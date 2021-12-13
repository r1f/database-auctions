/*
4. Вывести список покупателей и для каждого из них — список аукционов, где были сделаны приобретения в указанный интервал дат.
*/

SELECT LOA.ID_PerCust, P.Firstname_Per, P.Lastname_Per, LOA.ID_Auct, A.Specifics_Auct
FROM LotOnAuctions LOA
INNER JOIN Person P ON P.ID_Per=LOA.ID_PerCust
INNER JOIN Auctions A ON A.ID_Auct=LOA.ID_Auct
WHERE LOA.ID_PerCust IS NOT NULL AND A.Date_Auct BETWEEN '01.01.2010' AND '01.01.2013'
GROUP BY LOA.ID_PerCust, P.Firstname_Per, P.Lastname_Per, LOA.ID_Auct, A.Specifics_Auct
ORDER BY LOA.ID_PerCust;
