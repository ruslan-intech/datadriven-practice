WITH cte AS (
  SELECT 
    user_id,
    count(session_id) as session_count
  FROM user_sessions
  GROUP BY user_id
  HAVING count(session_id) > 2
)
SELECT
  u.username,
  cte.session_count
FROM cte
JOIN users u
ON u.user_id = cte.user_id
ORDER BY 2 DESC
