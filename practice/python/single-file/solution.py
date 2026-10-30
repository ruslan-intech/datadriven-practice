def flatten(feed):
  result = []
  stack = [feed]
  
  while stack:
    f = stack.pop()
    if isinstance(f, list):
        for child in f[-1::-1]:
          stack.append(child)
    else:
      result.append(f)
  
  return result
