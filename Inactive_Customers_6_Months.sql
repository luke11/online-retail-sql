SELECT
    customer_ID,
    MAX(InvoiceDate) AS LastInvoiceDate
FROM
    dbo.online_retail_II
WHERE
    customer_ID IS NOT NULL
    AND Quantity > 0
    AND Price > 0
    AND Invoice NOT LIKE 'C%'
GROUP BY
    customer_ID
HAVING
    MAX(InvoiceDate) < DATEADD(
        month,
        -6,
        (SELECT MAX(InvoiceDate) FROM dbo.online_retail_II)
    );
