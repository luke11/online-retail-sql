SELECT
    CASE 
        WHEN customer_id IS NULL THEN 'Null Customers'
        ELSE 'Real Customers'
    END AS customer_type,
    SUM(Quantity * Price) AS revenue,
    CAST(
        100.0 * SUM(Quantity * Price) 
        / SUM(SUM(Quantity * Price)) OVER ()
        AS DECIMAL(10,2)
    ) AS percent_of_total_revenue
FROM
    dbo.online_retail_II
WHERE
    Quantity > 0
    AND Price > 0
    AND Invoice NOT LIKE 'C%'
GROUP BY
    CASE 
        WHEN customer_id IS NULL THEN 'Null Customers'
        ELSE 'Real Customers'
    END;