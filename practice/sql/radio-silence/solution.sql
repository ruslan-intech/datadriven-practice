WITH ld AS (
  SELECT
    repo_name,
    DATEDIFF('second', 
        commit_at, 
        LEAD(commit_at) OVER(PARTITION BY repo_name ORDER BY commit_at)) * 1.0/ (24*60*60) longest_silence
  FROM repo_commits
),
max_ld as (
  SELECT 
    repo_name,
    max(longest_silence) AS longest_silence
  FROM ld
  GROUP BY repo_name
  HAVING COUNT(*) > 32
)
SELECT 
  repo_name,
  longest_silence,
  ROW_NUMBER() OVER(ORDER BY longest_silence DESC) silence_rank
FROM max_ld
