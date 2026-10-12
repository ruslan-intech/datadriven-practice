WITH s AS (
  SELECT 
    d.device_type,
    COUNT() AS session_count,
    AVG(us.session_duration_sec) AS avg_duration,
    MAX(us.session_duration_sec) AS max_duration
  FROM devices d
  JOIN user_sessions us
  ON us.device_id = d.device_id
  GROUP BY d.device_type
)
SELECT 
  device_type,
  avg_duration,
  max_duration,
  session_count
FROM s
WHERE session_count > 34
ORDER BY device_type
