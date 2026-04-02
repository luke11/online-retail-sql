SELECT TOP 10
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
HAVING 
    SUM(Quantity * Price) > 10000 
ORDER BY
    total_revenue DESC;
