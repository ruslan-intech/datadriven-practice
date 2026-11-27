WITH tt AS (
  SELECT 
     feat_name,
     LOWER(dtype) AS dtype,
     avg_val,
     null_pct,
     source
  FROM ml_features
  WHERE source IN ('transactions', 'page_views', 'ad_impressions')
  QUALIFY SUM(CASE WHEN source = 'transactions' THEN 1 ELSE 0 END) OVER(PARTITION BY feat_name, LOWER(dtype)) > 0 
  AND ( SUM(CASE WHEN source = 'page_views' THEN 1 ELSE 0 END) OVER(PARTITION BY feat_name, LOWER(dtype)) = 0 
  AND SUM(CASE WHEN source = 'ad_impressions' THEN 1 ELSE 0 END) OVER(PARTITION BY feat_name, LOWER(dtype)) = 0 )
)
SELECT 
  feat_name,
  dtype,	
  AVG(avg_val) AS avg_val,
  ROUND(AVG(null_pct), 2) AS null_pct
FROM tt
GROUP BY 
    feat_name,
    dtype
