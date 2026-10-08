WITH s AS (
  SELECT 
    user_id,
    DATE(MIN(session_start)) AS first_session_date   
  FROM user_sessions
  GROUP BY user_id
)
SELECT 
  first_session_date,
  COUNT(*) AS new_user_count
FROM s
GROUP BY first_session_date
ORDER BY first_session_date
