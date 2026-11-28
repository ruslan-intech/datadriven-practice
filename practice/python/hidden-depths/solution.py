def unflatten(flat: dict) -> dict:
  out = dict()
  
  for k, v in flat.items():
    cur = out
    k_split = k.split('.')
    for l in k_split[:-1]:
      if l not in cur:
        cur[l] = {}
      cur = cur[l]
    cur[k_split[-1]] = v
  return out
