SELECT 
  tbl_name,
  median(fail_pct) as median_fail_pct
FROM dq_checks
group by tbl_name
