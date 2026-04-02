SELECT
    AVG(total_items) AS avg_items_per_order
FROM (
    SELECT
        Invoice,
        SUM(Quantity) AS total_items
    FROM
        dbo.online_retail_II
    WHERE
        Quantity > 0
        AND Price > 0
        AND Invoice NOT LIKE 'C%'
    GROUP BY
        Invoice
) AS subquery;