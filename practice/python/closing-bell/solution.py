def portfolio_profit_calculator(prices: dict[str, float], purchases: list[list]):
  latest_price = prices[max(prices)]
  return sum(qty * (latest_price - prices[date]) for date, qty in purchases)
