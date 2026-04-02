WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(Quantity * Price) AS customer_revenue
    FROM
        dbo.online_retail_II
    WHERE
        customer_id IS NOT NULL
        AND Quantity > 0
        AND Price > 0
        AND Invoice NOT LIKE 'C%'
    GROUP BY
        customer_id
),
ranked_customers AS (
    SELECT
        customer_id,
        customer_revenue,
        NTILE(10) OVER (ORDER BY customer_revenue DESC) AS revenue_group
    FROM
        customer_revenue
)
SELECT
    SUM(CASE WHEN revenue_group = 1 THEN customer_revenue ELSE 0 END) AS top_10_percent_revenue,
    SUM(customer_revenue) AS total_revenue,
    CAST(
        100.0 * SUM(CASE WHEN revenue_group = 1 THEN customer_revenue ELSE 0 END)
        / SUM(customer_revenue)
        AS DECIMAL(10,2)
    ) AS percent_of_revenue_from_top_10_percent_customers
FROM
    ranked_customers;
