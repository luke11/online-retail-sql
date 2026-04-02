SELECT 
    Country,
    SUM(Quantity * Price) 
    / COUNT(DISTINCT Customer_ID) AS AvgRevenuePerCustomer
FROM dbo.online_retail_II
WHERE Quantity > 0
  AND Price > 0
  AND Customer_ID IS NOT NULL
GROUP BY Country
ORDER BY AvgRevenuePerCustomer DESC;