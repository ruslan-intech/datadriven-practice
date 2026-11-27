SELECT 
     feat_name,
     LOWER(dtype) AS dtype,
     AVG(avg_val) AS avg_val,
     ROUND(AVG(null_pct), 2) AS null_pct
  FROM ml_features
  WHERE source IN ('transactions', 'page_views', 'ad_impressions')
  GROUP BY 
    feat_name,
    LOWER(dtype)
  HAVING SUM(CASE WHEN source = 'transactions' THEN 1 ELSE 0 END)  > 0 
  AND ( SUM(CASE WHEN source = 'page_views' THEN 1 ELSE 0 END) = 0 
  AND SUM(CASE WHEN source = 'ad_impressions' THEN 1 ELSE 0 END) = 0 )
