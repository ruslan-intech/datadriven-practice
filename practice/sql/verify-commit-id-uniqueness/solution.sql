SELECT 
  COUNT(*) total_commits, 
  COUNT(DISTINCT author) AS distinct_authors
FROM repo_commits;
