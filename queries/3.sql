/*
3. Для указанного интервала дат вывести список продавцов в порядке убывания общей суммы, полученной ими от продажи предметов этот промежуток времени;
*/

SELECT DISTINCT P.ID_Per, P.FirstName_Per, P.LastName_Per, 
(SELECT SUM(LOA.Last_Prise) FROM LotOnAuctions LOA
		INNER JOIN Auctions A ON LOA.ID_Auct=A.ID_Auct
		WHERE A.Date_Auct BETWEEN '01.01.2010' AND '01.01.2015' AND P.ID_Per=LOA.ID_PerSel
		AND LOA.Last_Prise IS NOT NULL
) AS SumFromSel
FROM Person P 
INNER JOIN LotOnAuctions LOA ON LOA.ID_PerSel=P.ID_Per
ORDER BY SumFromSel DESC;