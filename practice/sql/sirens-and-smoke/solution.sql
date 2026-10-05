SELECT
  alert_id,
  svc_name,
  severity,
  status,
  fired_at,
  ack_by,
  resolved
FROM alert_events
WHERE YEAR(fired_at) = 2026
  AND LOWER(severity) IN ('high', 'critical')
ORDER BY fired_at
