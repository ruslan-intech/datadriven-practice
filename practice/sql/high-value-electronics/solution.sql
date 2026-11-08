SELECT 
  product_name,
  price
FROM products
WHERE LOWER(category) = 'electronics'
  AND in_stock = 1
QUALIFY ROW_NUMBER() OVER(ORDER BY price DESC) < 6
