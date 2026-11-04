SELECT
  user_id,
  COUNT(*) AS query_count,
  ROW_NUMBER() OVER (
    ORDER BY COUNT(*) DESC,
             CAST(user_id AS TEXT) ASC NULLS LAST
  ) AS rnk
FROM search_queries
GROUP BY user_id
ORDER BY rnk
