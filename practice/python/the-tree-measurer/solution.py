def max_depth(root) -> int:
  str_root = str(root)
  brackets = []
  nested_counter = 0
  max_counter = 0
  for s in str_root:
    if s == '{':
      brackets.append('{')
      nested_counter += 1
      max_counter = max(max_counter, nested_counter)
    elif s == '}':
      brackets.pop()
      nested_counter -= 1
       
  return  max_counter
