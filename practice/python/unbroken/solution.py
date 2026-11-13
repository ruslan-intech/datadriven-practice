def longest_hold(readings):
  if not readings:
    return 0
  
  prev = readings[0]
  cntr = 1
  max_cntr = cntr
  for cur in readings[1:]:
    if prev <= cur:
      cntr += 1
      max_cntr = max(max_cntr, cntr)
    else:
      cntr = 1
      
    prev = cur
      
  return max_cntr
