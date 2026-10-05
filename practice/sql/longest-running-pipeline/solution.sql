WITH rnk AS (
  SELECT pipe_name, dur_secs
  FROM data_pipes
  QUALIFY ROW_NUMBER() OVER(ORDER BY dur_secs DESC) = 1
)
SELECT pipe_name
FROM rnk
