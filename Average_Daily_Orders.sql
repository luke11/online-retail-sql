SELECT
    AVG(daily_orders) AS avg_orders_per_day
FROM (
    SELECT
        CAST(InvoiceDate AS DATE) AS order_date,
        COUNT(DISTINCT Invoice) AS daily_orders
    FROM
        dbo.online_retail_II
    WHERE
        Quantity > 0
        AND Price > 0
        AND Invoice NOT LIKE 'C%'
    GROUP BY
        CAST(InvoiceDate AS DATE)
) AS subquery;
