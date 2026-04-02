WITH RankedSales AS (
    SELECT
        Country,
        Description,
        SUM(Quantity) AS TotalQuantitySold,
        ROW_NUMBER() OVER (
            PARTITION BY Country
            ORDER BY SUM(Quantity) DESC
        ) AS rn
    FROM dbo.online_retail_II
    WHERE Quantity > 0
      AND Description IS NOT NULL
    GROUP BY Country, Description
)
SELECT
    Country,
    Description,
    TotalQuantitySold
FROM RankedSales
WHERE rn <= 10
ORDER BY Country ASC, rn ASC;