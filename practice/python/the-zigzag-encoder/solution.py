def zigzag_encode(s: str, num_rows: int) -> str:
  if num_rows == 1:
    return s
  
  out = [[] for _ in range(num_rows)]
  cntr = 0
  
  zigzag = False
  for s_ in s:
    if not zigzag:
      out[cntr].append(s_)
      cntr += 1
    else:
      out[cntr].append(s_)
      cntr -= 1
      if cntr == 0:
        zigzag = False
      
    if cntr == num_rows:
      cntr = num_rows - 2
      zigzag = cntr > 0
      
  return "".join("".join(row) for row in out)
