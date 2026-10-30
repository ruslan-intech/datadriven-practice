def flatten(feed):
  result = []
  def dfs(node):
    if isinstance(node, list):
      for child in node:
        dfs(child)        
    else:
      result.append(node)
  dfs(feed)
  return result
