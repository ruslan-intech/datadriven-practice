SELECT p.product_name, 
    SUM(t.total_amount) as total_revenue
FROM transactions t
JOIN products p
  ON p.product_id = t.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5
