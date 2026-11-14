def dedup_preserve_order(items: list) -> list:
  slow = 0
  
  for fast in range(len(items)):
    if items[slow] != items[fast] and items[fast] not in items[:slow + 1]:
      slow += 1
      items[slow] = items[fast]
      
  return items[:slow+1]
