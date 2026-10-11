WITH hrs AS (
  SELECT
    status,
    HOUR(call_time) AS hours
  FROM api_calls
  WHERE 1=1
    AND COALESCE(err_msg, '') != ''
),
common_count AS (
SELECT 
  status,
  CASE WHEN hours < 12 THEN 'Morning'
       WHEN hours BETWEEN 12 AND 15 THEN 'Early Afternoon'
       ELSE 'Late Afternoon'
   END AS time_segment,
   COUNT(*) AS call_count
FROM hrs
GROUP BY 
  status,
  CASE WHEN hours < 12 THEN 'Morning'
       WHEN hours BETWEEN 12 AND 15 THEN 'Early Afternoon'
       ELSE 'Late Afternoon'
   END
)
SELECT 
  status,	
  time_segment,
  call_count
FROM common_count
QUALIFY DENSE_RANK() OVER(ORDER BY call_count DESC) <= 3
ORDER BY call_count DESC;
