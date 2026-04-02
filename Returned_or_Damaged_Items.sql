SELECT
    Description,
    SUM(Quantity) AS TotalReturned
FROM dbo.online_retail_II
WHERE Quantity < 0
  AND Description IS NOT NULL
GROUP BY Description
ORDER BY TotalReturned ASC;