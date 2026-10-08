WITH s AS (
  SELECT 
    svc_name,
    version,
    deploy_at,
    DATE(deploy_at) AS deploy_date
  FROM deploy_logs
  WHERE LOWER(status) = 'success'
    AND LOWER(env_name) = 'production'
),
num_days AS (
  SELECT 
    svc_name,
    version,
    deploy_at,
    DATE_DIFF(
      'day',
      deploy_date,
      LEAD(deploy_date) OVER (PARTITION BY svc_name ORDER BY deploy_at)
    ) AS days_live
  FROM s
)
SELECT 
  svc_name,
  version,
  days_live
FROM num_days
WHERE days_live IS NOT NULL
ORDER BY days_live DESC, svc_name, deploy_at
