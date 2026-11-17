def merge_k_sorted(lists: list) -> list:
  out = []
  for x in lists:
    for y in x:
      out.append(y)
      
  out.sort()      
  
  return out
