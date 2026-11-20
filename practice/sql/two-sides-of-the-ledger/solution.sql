WITH movements AS (
    SELECT region,
           SUBSTR(bill_date, 1, 7) AS month,
           -TRUNC(amount)          AS amt
    FROM cloud_costs
    UNION ALL
    SELECT region,
           period                  AS month,
           TRUNC(amount)           AS amt 
    FROM cost_allocs
),
monthly AS (
    SELECT region, month, SUM(amt) AS net_movement
    FROM movements
    GROUP BY region, month
)
SELECT 
  region,
  month,
  net_movement as amt,
  SUM(net_movement) OVER(PARTITION BY region ORDER BY month) AS running_balance
FROM monthly
