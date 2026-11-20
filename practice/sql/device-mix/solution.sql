WITH cte AS (
  SELECT 
    device_type,
    os_name,
    COUNT(*) AS device_count
  FROM devices
  WHERE browser is not null
  GROUP BY     
    device_type,
    os_name
)
SELECT
    device_type,
    os_name,
    device_count  
FROM cte
WHERE device_count >= 3
