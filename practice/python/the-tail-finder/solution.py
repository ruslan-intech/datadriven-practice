def find_tail(lst: list):
  def tail_value(node, i = 0):
    if not node:
      return None
    if i == len(node) - 1:
      return lst[i]
    
    return tail_value(node, i+1)
  
  return tail_value(lst)
