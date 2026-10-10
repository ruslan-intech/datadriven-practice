SELECT 
  COUNT(DISTINCT owner_id) AS non_read_owner_count
FROM api_tokens
WHERE scope NOT LIKE 'read%'
