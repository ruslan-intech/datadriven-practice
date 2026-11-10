WITH tmp AS (
  SELECT
    user_id,
    COUNT(*) purchase_count
  FROM event_data
  WHERE LOWER(event_type) = 'purchase'
  GROUP BY user_id
),
page_views AS (
  SELECT
    user_id,
    event_id,
    event_type
  FROM event_data
  WHERE LOWER(event_type) = 'page_view'
  QUALIFY ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY event_id) = 1
)
SELECT pv.user_id,
       COALESCE(tmp.purchase_count, 0) AS purchase_count
FROM page_views AS pv 
LEFT JOIN tmp
  ON tmp.user_id = pv.user_id
ORDER BY purchase_count DESC
