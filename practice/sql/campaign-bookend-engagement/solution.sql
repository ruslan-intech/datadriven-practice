WITH t AS (
  SELECT
    ad_campaign,
    DATE(impression_time) AS d,
    MIN(DATE(impression_time)) OVER (PARTITION BY ad_campaign) AS first_day,
    MAX(DATE(impression_time)) OVER (PARTITION BY ad_campaign) AS last_day
  FROM ad_impressions
)
SELECT
  ad_campaign,
  100.0 * SUM(CASE WHEN d = first_day THEN 1 ELSE 0 END) / COUNT(*) AS first_day_pct,
  100.0 * SUM(CASE WHEN d = last_day  THEN 1 ELSE 0 END) / COUNT(*) AS last_day_pct
FROM t
GROUP BY ad_campaign
ORDER BY ad_campaign;
