WITH order_totals AS (
    SELECT
        Country,
        Invoice,
        SUM(Quantity * Price) AS OrderValue
    FROM
        dbo.online_retail_II
    WHERE
        Quantity > 0
        AND Price > 0
        AND Invoice NOT LIKE 'C%'
    GROUP BY
        Country,
        Invoice
)
SELECT
    Country,
    AVG(OrderValue) AS AverageOrderValue
FROM
    order_totals
GROUP BY
    Country
ORDER BY
    AverageOrderValue DESC;