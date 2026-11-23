WITH cte AS (
  SELECT
    p.category,
    COUNT(*) as txn_count
  FROM transactions t
  JOIN products p
  ON p. product_id = t.product_id
  WHERE p.rating >= 3.0
  GROUP BY category
)
SELECT 
  category,
  txn_count,
  DENSE_RANK() OVER (ORDER BY txn_count DESC) as rnk
FROM cte
QUALIFY DENSE_RANK() OVER (ORDER BY txn_count DESC) < 4
