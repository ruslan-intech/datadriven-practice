WITH ss AS (
  SELECT
    user_id,
    transaction_date,
    LEAD(transaction_date) OVER(PARTITION BY user_id ORDER BY transaction_date) next_date
  FROM transactions
)
SELECT DISTINCT user_id
FROM ss
WHERE datediff(days, transaction_date, next_date) BETWEEN 65 AND 80
ORDER BY user_id
