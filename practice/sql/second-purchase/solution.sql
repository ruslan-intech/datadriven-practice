SELECT
  user_id,
  total_amount,
  transaction_date
FROM transactions
QUALIFY ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) = 2
