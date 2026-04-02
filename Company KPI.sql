SELECT
    SUM(CASE 
        WHEN Quantity > 0
             AND Price > 0
             AND Invoice NOT LIKE 'C%'
        THEN Quantity * Price
        ELSE 0
    END) AS total_revenue,

    COUNT(DISTINCT CASE
        WHEN Quantity > 0
             AND Price > 0
             AND Invoice NOT LIKE 'C%'
        THEN Invoice
    END) AS total_orders,

    COUNT(DISTINCT CASE
        WHEN Customer_ID IS NOT NULL
             AND Quantity > 0
             AND Price > 0
             AND Invoice NOT LIKE 'C%'
        THEN Customer_ID
    END) AS total_customers,

    SUM(CASE
        WHEN Quantity > 0
             AND Price > 0
             AND Invoice NOT LIKE 'C%'
        THEN Quantity
        ELSE 0
    END) AS total_items_sold,

    SUM(CASE
        WHEN Quantity < 0
        THEN ABS(Quantity * Price)
        ELSE 0
    END) AS total_returns_value
FROM
    dbo.online_retail_II;