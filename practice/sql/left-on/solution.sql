SELECT
  flag_name,
  owner,
  CASE WHEN enabled = 1 OR updated IS NULL THEN 'Yes'
       ELSE 'No'
  END AS still_enabled,
  FLOOR(date_diff('days', created, '2026-05-01') / 365) AS years_since_creation
FROM feat_flags
WHERE date_diff('days', created, '2026-05-01') > 730
ORDER BY flag_name, 
  owner,
  years_since_creation DESC,
  still_enabled
