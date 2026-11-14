from collections import Counter
def dedup_preserve_order(items: list) -> list:
  return list(Counter(items).keys())
