SELECT 
  tbl_name,
  count(*) as failing_checks,
  sum(case when lower(severity) in ('critical', 'high') then 1 else 0 end) as high_severity_failures
FROM dq_checks
WHERE passed = False
GROUP BY tbl_name
ORDER BY failing_checks DESC, tbl_name
