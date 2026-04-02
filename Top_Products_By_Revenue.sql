SELECT
    Description,
    SUM(Quantity) AS TotalQuantitySold,
    SUM(Quantity * Price) AS TotalRevenue
FROM dbo.online_retail_II
WHERE Quantity > 0
  AND Price > 0
  AND Description IS NOT NULL
GROUP BY Description
ORDER BY TotalRevenue DESC;