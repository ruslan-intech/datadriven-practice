WITH CTE AS (
  SELECT 
    DATE(sent_at) date_edit,
    SUM(CASE WHEN edited = 'true' THEN 1 ELSE 0 END) as edit_cnt,
    SUM(CASE WHEN edited = 'false' THEN 1 ELSE 0 END) as nedit_cnt  
  FROM chat_msgs
  GROUP BY DATE(sent_at)
)
SELECT DISTINCT CM.*
FROM CTE
JOIN chat_msgs AS CM
  ON DATE(CM.sent_at) = CTE.date_edit
WHERE edit_cnt > nedit_cnt
