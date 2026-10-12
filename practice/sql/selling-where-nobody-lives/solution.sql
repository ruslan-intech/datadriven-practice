SELECT DISTINCT region 
FROM orders
WHERE lower(status) IN ('shipped', 'completed')
AND profit > 1200
AND region IS NOT NULL
