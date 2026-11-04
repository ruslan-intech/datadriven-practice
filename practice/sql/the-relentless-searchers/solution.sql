WITH ui AS (
  SELECT
    user_id,
    COALESCE(user_id, 0) AS coalesced_user_id,
    COUNT(*) as query_count
  FROM search_queries
  GROUP BY user_id
)
SELECT 
  user_id,
  query_count,
  DENSE_RANK() OVER(ORDER BY query_count DESC, CAST(coalesced_user_id AS STRING)) AS rnk
FROM ui
