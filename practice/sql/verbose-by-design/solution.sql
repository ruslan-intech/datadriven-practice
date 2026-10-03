WITH paths AS (
    SELECT DISTINCT endpoint
    FROM api_calls
    WHERE endpoint IS NOT NULL
),
trimmed AS (
    SELECT endpoint,
           TRIM(endpoint, '/') AS t
    FROM paths
)
SELECT endpoint,
       LENGTH(t) AS trimmed_len,
       CASE WHEN t = '' THEN 0
            ELSE LENGTH(t) - LENGTH(REPLACE(t, '/', '')) + 1
       END AS word_count
FROM trimmed
ORDER BY word_count DESC, endpoint ASC;
