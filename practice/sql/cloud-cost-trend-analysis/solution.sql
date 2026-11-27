SELECT 
  svc_name,	
  bill_date,	
  amount, 
  amount - lag(amount) over(PARTITION BY svc_name ORDER BY bill_date) AS price_change
FROM cloud_costs
ORDER BY 1, 2
