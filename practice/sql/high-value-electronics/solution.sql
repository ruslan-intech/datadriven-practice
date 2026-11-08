WITH cte AS (
  SELECT 
    product_name,
    price,
    ROW_NUMBER() OVER(ORDER BY price DESC) AS rn
  FROM products
  WHERE LOWER(category) = 'electronics'
    AND in_stock = 1
)
SELECT 
  product_name,
  price
FROM cte
WHERE rn < 6
