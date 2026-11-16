def filter_integers(items: list) -> list[int]:
  slow = -1
  for fast in range(len(items)):
    if isinstance(items[fast], int) and not isinstance(items[fast], bool):
       slow += 1
       items[slow] = items[fast]
       
  return items[:slow+1]
