WITH un AS (
  select 
    region,
    svc_name AS svc_name, 
    amount
  from cloud_costs
    UNION ALL
  select 
    region,
    svc_name, 
    amount
  from cost_allocs
),
aggr AS(
  SELECT 
    region,
    svc_name,
    amount,
    ROW_NUMBER() OVER(PARTITION BY region ORDER BY amount DESC) as RN_MAX,
    ROW_NUMBER() OVER(PARTITION BY region ORDER BY amount ASC) as RN_MIN
  FROM un
  QUALIFY ROW_NUMBER() OVER(PARTITION BY region ORDER BY amount DESC) = 1
      OR ROW_NUMBER() OVER(PARTITION BY region ORDER BY amount ASC) = 1
)
select 
  a1.region,
  a1.svc_name as most_expensive,
  a2.svc_name as cheapest
from aggr a1
JOIN aggr a2 
  ON a1.region = a2.region
where a1.RN_MAX = 1
  AND a2.RN_MIN = 1
