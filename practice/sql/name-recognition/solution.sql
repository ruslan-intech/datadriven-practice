SELECT DISTINCT svc_name,
       CASE WHEN svc_name LIKE '%api%' THEN 'api_service'
            WHEN svc_name LIKE 'cache%' THEN 'cache_service'
            WHEN svc_name LIKE '%redis%' THEN 'cache_service'
            WHEN svc_name LIKE '%db%' THEN 'database'
            WHEN svc_name LIKE '%postgres%' THEN 'database'
            ELSE 'other'
       END AS category
FROM svc_health
