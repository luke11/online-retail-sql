SELECT
    YEAR(InvoiceDate) AS order_year,
    MONTH(InvoiceDate) AS order_month,
    COUNT(DISTINCT Invoice) AS total_orders
FROM
    dbo.online_retail_II
WHERE
    Quantity > 0
    AND Price > 0
    AND Invoice NOT LIKE 'C%'
GROUP BY
    YEAR(InvoiceDate),
    MONTH(InvoiceDate)
ORDER BY
    order_year,
    order_month;