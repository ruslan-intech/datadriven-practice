SELECT
  CONCAT(first_name, ' ', last_name) AS full_name,	
  customer_id,
  country
FROM customers
ORDER BY 
  first_name, 
  last_name,
  customer_id
