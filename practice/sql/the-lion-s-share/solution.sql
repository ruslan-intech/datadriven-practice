SELECT
  p.category,
  SUM(total_amount) AS total_revenue,
  COUNT(*) AS transaction_count
FROM transactions t
JOIN products p
ON t.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC
