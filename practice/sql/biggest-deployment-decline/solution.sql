WITH cte AS (
  SELECT dl.svc_name,
         YEAR(deploy_at) as year_deploy
  FROM deploy_logs dl
  WHERE YEAR(deploy_at) in (2025, 2026)
  AND EXISTS (SELECT 1 FROM svc_health WHERE svc_name = dl.svc_name)
),
agg AS (
  SELECT 
    svc_name,
    SUM(CASE WHEN year_deploy = 2025 THEN 1 ELSE 0 END) AS deploy_2025,
    SUM(CASE WHEN year_deploy = 2026 THEN 1 ELSE 0 END) AS deploy_2026
  FROM cte
  GROUP BY svc_name
)
SELECT svc_name,
       deploy_2026 - deploy_2025 AS deploy_growth
FROM agg
ORDER BY deploy_growth DESC
LIMIT 1
