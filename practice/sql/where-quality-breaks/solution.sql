SELECT 
  tbl_name,
  count(*) as failed_checks,
  count(DISTINCT rule) as distinct_rules,
  AVG(fail_pct) AS avg_fail_pct
FROM dq_checks
WHERE passed = 0 
GROUP BY tbl_name
HAVING AVG(fail_pct) > 30
ORDER BY avg_fail_pct DESC
