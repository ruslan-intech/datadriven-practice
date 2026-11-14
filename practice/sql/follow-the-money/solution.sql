WITH cte AS (
  SELECT 
    user_id,
    SUM(total_amount) AS total_spent 
  FROM transactions
  WHERE YEAR(transaction_date) = 2026
  GROUP BY user_id
)
SELECT
  user_id,
  total_spent
FROM cte
ORDER BY total_spent DESC
