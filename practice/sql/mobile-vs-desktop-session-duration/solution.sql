WITH cte AS (
  SELECT user_id,
        CASE WHEN device_type = 'mobile'
          THEN session_duration_sec
          ELSE NULL
        END mobile_session,
        CASE WHEN device_type = 'desktop'
          THEN session_duration_sec
          ELSE NULL
        END desktop_session      
  FROM user_sessions US
  JOIN devices D
  ON D.device_id = US.device_id
  WHERE YEAR(session_start) = 2025
)
SELECT user_id, 
  MAX(mobile_session) AS longest_mobile,
  MAX(desktop_session) AS longest_desktop
FROM cte
GROUP BY user_id
