def chunked_read(lines: list, chunk_size: int):
  out = ([lines[i:i+chunk_size] for i in range(0, len(lines), chunk_size)])

  return out
