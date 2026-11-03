WITH ss AS (
  SELECT
    lower(team_name) AS team_name,
    SUM(amount) AS monthly_cost, 
    period
  FROM cost_allocs
  GROUP BY lower(team_name), period
)
SELECT DISTINCT
  team_name,
  monthly_cost
FROM ss
QUALIFY DENSE_RANK() OVER(PARTITION BY team_name ORDER BY monthly_cost DESC) < 4
ORDER BY team_name
