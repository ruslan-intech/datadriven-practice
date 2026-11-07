from collections import defaultdict

def group_by_hour(events):
  out = defaultdict(list)
  for e in events:
    e_hour = e['ts'][:13]
    e_type = e['type']
    out[e_hour].append(e_type)

  return out
