SELECT
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
        COUNT(DISTINCT CASE 
            WHEN Invoice NOT LIKE 'C%' 
                 AND Quantity > 0 
                 AND Price > 0 
            THEN Invoice 
        END)
        AS DECIMAL(10,2)
    ) AS percent_orders_returned
FROM
    dbo.online_retail_II;