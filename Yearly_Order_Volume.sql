SELECT
    YEAR(InvoiceDate) AS order_year,
    COUNT(DISTINCT Invoice) AS total_orders
FROM
    dbo.online_retail_II
WHERE
    Quantity > 0
    AND Price > 0
    AND Invoice NOT LIKE 'C%'
    AND YEAR(InvoiceDate) IN (2009, 2010, 2011)
GROUP BY
    YEAR(InvoiceDate)
ORDER BY
    order_year;
