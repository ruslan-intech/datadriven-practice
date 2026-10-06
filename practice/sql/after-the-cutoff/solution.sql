SELECT svc_name as svc_name,
  count(*) AS deploy_count,
  MAX(dur_secs) AS max_duration 
FROM deploy_logs
WHERE env_name = 'production'
  AND CAST(strftime('%m', deploy_at) AS INTEGER) >= 4
GROUP BY svc_name
