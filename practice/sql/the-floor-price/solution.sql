SELECT
    UPPER(provider) AS provider,
    MAX(amount) AS max_amount
FROM cloud_costs
WHERE acct_id IS NOT NULL
GROUP BY UPPER(provider)
