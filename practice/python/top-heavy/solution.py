def inverted_triangle(n: int) -> list[str]:
  out = []
  for i in range(n, 0, -1):
    ln = "*"*i
    out.append(ln)
    
  return out
