SELECT
    SUM(CASE
        WHEN Quantity > 0
             AND Price > 0
             AND Invoice NOT LIKE 'C%'
        THEN Quantity * Price
        ELSE 0
    END) AS gross_revenue,

    SUM(CASE
        WHEN Quantity < 0
             AND Invoice LIKE 'C%'
        THEN ABS(Quantity * Price)
        ELSE 0
    END) AS returns_value,

    SUM(CASE
        WHEN Quantity > 0
             AND Price > 0
             AND Invoice NOT LIKE 'C%'
        THEN Quantity * Price
        ELSE 0
    END)
    -
    SUM(CASE
        WHEN Quantity < 0
             AND Invoice LIKE 'C%'
        THEN ABS(Quantity * Price)
        ELSE 0
    END) AS net_revenue
FROM
    dbo.online_retail_II;