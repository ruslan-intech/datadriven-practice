-- need to find number of week
-- week to Q = week / 13
WITH cte AS (
  SELECT 
    COUNT(*) * 1.0 / 13 as deploys_per_week,
    DATE_TRUNC('quarter', deploy_at) as year_quarter
  FROM deploy_logs
  GROUP BY year_quarter
)
SELECT 
  CONCAT
  (
    DATE_FORMAT(year_quarter, '%Y') , 
    '-',
    CASE WHEN DATE_FORMAT(year_quarter, '%m') = '01' THEN 'Q1'
         WHEN DATE_FORMAT(year_quarter, '%m') = '04' THEN 'Q2'
         WHEN DATE_FORMAT(year_quarter, '%m') = '07' THEN 'Q3'
         WHEN DATE_FORMAT(year_quarter, '%m') = '10' THEN 'Q4'
    END 
  ) AS quarter,
  deploys_per_week
FROM cte
order by deploys_per_week DESC
