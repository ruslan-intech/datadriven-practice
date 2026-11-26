def dictionary_key_intersection(d1: dict, d2: dict):
  out = []

  for k, v in d1.items():
    if k in d2:
      tmp = [k, v]
      out.append(tmp)
  
  out.sort(key = lambda x:x[0])
  
  return out
