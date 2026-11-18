from collections import defaultdict

def merge_holds(holds):
  holds.sort(key = lambda x:(x["card"], x["start"]))
  out = defaultdict(list)
  for h in holds:
    if out[h["card"]] == []:
      out[h["card"]].append([h["start"], h["end"]])
    else:
      last_val = out[h["card"]][-1]
      if last_val[1] >= h["start"]:
        last_val[1] = max(last_val[1], h["end"])
        out[h["card"]][-1] = last_val
      elif last_val[1] < h["start"]:
        out[h["card"]].append([h["start"], h["end"]])
  return out
