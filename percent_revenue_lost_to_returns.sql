SELECT
    CAST(
        100.0 * SUM(CASE
            WHEN Invoice LIKE 'C%' AND Quantity < 0
            THEN ABS(Quantity * Price)
            ELSE 0
        END)
        /
        SUM(CASE
            WHEN Invoice NOT LIKE 'C%'
                 AND Quantity > 0
                 AND Price > 0
            THEN Quantity * Price
            ELSE 0
        END)
        AS DECIMAL(10,2)
    ) AS percent_revenue_lost_to_returns
FROM
    dbo.online_retail_II;