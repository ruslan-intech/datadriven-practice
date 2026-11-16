WITH cte AS (
  SELECT 
    svc_name,
    SUM(amount) AS total_amount
  FROM cloud_costs
  WHERE amount > 0
  GROUP BY svc_name
),
cnt AS (
  SELECT svc_name,
         total_amount,
         ROW_NUMBER() OVER(ORDER BY total_amount DESC) AS rn_desc,
         ROW_NUMBER() OVER(ORDER BY total_amount ASC) AS rn_asc
  FROM cte
)
SELECT 
  svc_name,
  total_amount
FROM cnt
WHERE rn_asc <= 3
  OR rn_desc <= 3
ORDER BY total_amount
