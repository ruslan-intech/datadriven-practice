SELECT
  COUNT(*) AS low_severity_count
FROM dq_checks
WHERE severity = 'low'
AND YEAR(run_at) = 2026
