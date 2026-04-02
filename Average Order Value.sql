SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        Invoice,
        SUM(Price * Quantity) AS order_total
    FROM
        dbo.online_retail_II
    WHERE
        Quantity > 0
        AND Price > 0
        AND Invoice NOT LIKE 'C%'
    GROUP BY
        Invoice
) AS subquery;