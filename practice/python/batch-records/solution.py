def chunk_list(records, n):
  out = []
  for i in range(0, len(records), n):
    out.append(records[i:i+n])
  return out
