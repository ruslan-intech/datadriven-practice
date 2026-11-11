SELECT 
  product_name,
  price
FROM products
WHERE in_stock = 1
  AND category = 'Electronics'
QUALIFY ROW_NUMBER() OVER(ORDER BY price DESC) < 6
