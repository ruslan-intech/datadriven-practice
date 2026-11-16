WITH cte AS (
  SELECT 
    svc_name,
    SUM(CASE WHEN amount < 0 THEN 0 ELSE amount END) AS total_amount
  FROM cloud_costs
  WHERE amount >= 0
  GROUP BY svc_name
),
cnt AS (
  SELECT svc_name,
         total_amount,
         ROW_NUMBER() OVER(ORDER BY total_amount DESC) AS rn_desc,
         COUNT() OVER() - ROW_NUMBER() OVER(ORDER BY total_amount DESC) + 1 AS rn_rev
  FROM cte
)
SELECT 
  svc_name,
  total_amount
FROM cnt
WHERE rn_rev <= 3
  UNION ALL
SELECT 
  svc_name,
  total_amount
FROM cnt
WHERE rn_desc <= 3
ORDER BY total_amount
