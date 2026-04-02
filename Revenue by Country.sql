SELECT
    Country,
    SUM(Quantity * Price) AS TotalRevenue
FROM
    dbo.online_retail_II
GROUP BY
    Country
ORDER BY
    TotalRevenue DESC;
