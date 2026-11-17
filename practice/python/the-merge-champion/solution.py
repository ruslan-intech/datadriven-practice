def merge_k_sorted(lists: list) -> list:
  out = []
  for x in lists:
    if type(x) is list:
      for y in x:
        out.append(y)
    else:
      out.append(x)
      
  out.sort()      
  
  return out
