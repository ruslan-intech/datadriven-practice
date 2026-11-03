SELECT CI.content_type,
       COUNT(*) AS view_count
FROM content_items CI
JOIN content_views CV 
ON CI.content_id = CV.content_id
GROUP BY CI.content_type
