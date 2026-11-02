WITH ss AS (
  SELECT DISTINCT
    user_id,
    transaction_date
  FROM transactions
),
start_end AS (
  SELECT user_id,
         transaction_date,
         CAST(transaction_date AS DATE) + INTERVAL 1 DAY AS start_date,
         CAST(transaction_date AS DATE) + INTERVAL 7 DAY AS end_date
  FROM ss
)
SELECT DISTINCT
    se.user_id,
    se.transaction_date
FROM transactions t
JOIN start_end se
  ON t.user_id = se.user_id
 AND CAST(t.transaction_date AS DATE) BETWEEN se.start_date AND se.end_date
