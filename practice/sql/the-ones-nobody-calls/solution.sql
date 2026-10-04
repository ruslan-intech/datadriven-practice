WITH s AS (
  SELECT endpoint,
         COUNT(*) call_count
  FROM api_calls
  WHERE LOWER(method) = 'post'
  GROUP BY endpoint
),
rnk AS (
  SELECT endpoint, call_count,
         DENSE_RANK() OVER(ORDER BY call_count) AS rnk 
  FROM s
)
SELECT *
FROM rnk
WHERE rnk <= 3
ORDER BY call_count, rnk
