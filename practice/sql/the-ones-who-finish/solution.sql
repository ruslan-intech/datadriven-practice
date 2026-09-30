SELECT ci.content_type AS content_format, 
      ROUND(AVG(cv.watch_seconds * 1.0 / ci.duration_seconds), 3) AS avg_completion_rate,
      count(*) AS view_count
FROM content_views cv
JOIN content_items ci
ON ci.content_id = cv.content_id
WHERE year(cv.viewed_at) = 2026
  AND COALESCE(ci.duration_seconds, 0) > 0 
GROUP BY ci.content_type
ORDER BY avg_completion_rate DESC
