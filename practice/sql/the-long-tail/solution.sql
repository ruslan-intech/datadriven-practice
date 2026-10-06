WITH timed AS (
    SELECT
        UPPER(method) AS method,
        latency,
        ROW_NUMBER() OVER (
            PARTITION BY UPPER(method)
            ORDER BY latency
        ) AS rn
    FROM api_calls
    WHERE latency IS NOT NULL
)
SELECT
    method,
    ROUND(AVG(latency), 2) AS fastest_five_avg
FROM timed
WHERE rn <= 5
GROUP BY method
ORDER BY method;
