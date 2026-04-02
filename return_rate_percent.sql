SELECT
    Description,
    COUNT(DISTINCT CASE
        WHEN Invoice LIKE 'C%' THEN Invoice
    END) AS returned_orders,
    COUNT(DISTINCT CASE
        WHEN Invoice NOT LIKE 'C%'
             AND Quantity > 0
             AND Price > 0
        THEN Invoice
    END) AS completed_orders,
    CAST(
        100.0 * COUNT(DISTINCT CASE
            WHEN Invoice LIKE 'C%' THEN Invoice
        END)
        /
        NULLIF(COUNT(DISTINCT CASE
            WHEN Invoice NOT LIKE 'C%'
                 AND Quantity > 0
                 AND Price > 0
            THEN Invoice
        END), 0)
        AS DECIMAL(10,2)
    ) AS return_rate_percent
FROM
    dbo.online_retail_II
WHERE
    Description IS NOT NULL
GROUP BY
    Description
ORDER BY
    return_rate_percent DESC;