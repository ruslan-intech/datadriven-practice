WITH cte AS (
  SELECT 
    LEFT(bill_date, 7) AS billing_month,
    SUM(amount) AS total_spend,
    ROW_NUMBER() OVER(ORDER BY SUM(amount) DESC) AS rn
  FROM cloud_costs
  GROUP BY billing_month
)
SELECT *
FROM cte
WHERE rn = 1
