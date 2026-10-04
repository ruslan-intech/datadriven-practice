WITH s AS (
  SELECT 'main' AS branch,
         0 AS build_main,
         0 AS build_release,
         NULL AS dur_secs
  UNION ALL
  
  SELECT 'release' AS branch,
         0 AS build_main,
         0 AS build_release,
         NULL AS dur_secs
  UNION ALL  
  
  SELECT
    LOWER(branch) AS branch,
    CASE WHEN LOWER(branch) = 'main' THEN 1 ELSE 0 END AS build_main,
    CASE WHEN LOWER(branch) = 'release' THEN 1 ELSE 0 END AS build_release,
    dur_secs
  FROM ci_builds
  WHERE 1=1
  AND YEAR(built_at) = 2026
  AND (trigger != 'manual' OR trigger IS NULL)
)
SELECT
  branch,

  CASE WHEN branch = 'main' THEN
        SUM(build_main)
       WHEN branch = 'release' THEN  
         SUM(build_release)
  END as build_count,
  
  CASE WHEN branch = 'main' THEN
        CAST(SUM(build_main) AS DECIMAL)
       WHEN branch = 'release' THEN  
         CAST(SUM(build_release) AS DECIMAL)
  END as build_count_decimal,
  ROUND(AVG(dur_secs), 3) AS avg_duration 

FROM s
WHERE branch IN ('main', 'release')
GROUP BY branch
