SELECT
    customer_id,
    SUM(Quantity * Price) AS total_revenue
FROM
    dbo.online_retail_II
WHERE
    customer_id IS NOT NULL
    AND Quantity > 0
    AND Price > 0
    AND Invoice NOT LIKE 'C%'
GROUP BY
    customer_id
ORDER BY
    total_revenue DESC;