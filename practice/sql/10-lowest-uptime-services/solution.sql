WITH cte AS (
SELECT
svc_name,
MIN(uptime) AS min_uptime
FROM svc_health
WHERE uptime IS NOT NULL
GROUP BY svc_name
)
SELECT svc_name, min_uptime
FROM cte
QUALIFY  DENSE_RANK() OVER(ORDER BY min_uptime) < 11
