WITH user_category AS (
  SELECT
    p.category,
    t.user_id,
    COUNT(*)                        AS txn_count,
    SUM(t.total_amount)             AS spend,
    SUM(t.total_amount) / COUNT(*)  AS avg_basket
  FROM transactions t
  JOIN products p ON p.product_id = t.product_id
  GROUP BY p.category, t.user_id
),
tiered AS (
  SELECT
    *,
    CASE
      WHEN avg_basket > 500  THEN 'High'
      WHEN avg_basket >= 200 THEN 'Medium'
      ELSE 'Low'
    END AS segment
  FROM user_category
)
SELECT
  category,
  segment,
  COUNT(*)                   AS unique_users,
  SUM(txn_count)             AS total_transactions,
  ROUND(SUM(spend), 3)       AS total_sales,
  ROUND(AVG(avg_basket), 3)  AS avg_basket_size
FROM tiered
GROUP BY category, segment
ORDER BY category, segment;
