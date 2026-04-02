SELECT 
    Description, 
    SUM(Quantity) AS TotalQuantitySold
FROM dbo.online_retail_II
WHERE Quantity > 0
  AND Description IS NOT NULL
GROUP BY Description
ORDER BY TotalQuantitySold DESC;