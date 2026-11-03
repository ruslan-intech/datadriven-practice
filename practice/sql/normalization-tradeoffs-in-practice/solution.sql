SELECT 
  p.category,
  SUM(t.quantity * p.price) as total_revenue
FROM products p
JOIN transactions t
ON p.product_id = t.product_id
GROUP BY p.category
