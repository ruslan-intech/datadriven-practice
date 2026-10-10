WITH cl AS(
  SELECT 
    lower(framework) as framework,
    accuracy,
    replace(replace(version, 'v', ''), '-beta', '') as version
  FROM ml_models
)
SELECT
  framework,
  ROUND(AVG(accuracy), 2) AS avg_accuracy
FROM cl
WHERE version like '1%'
  OR version like '2.0%'
GROUP BY framework
