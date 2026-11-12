from collections import deque

def shortest_path(graph: dict, start: str, end: str) -> int:
  queue = deque([(start, 0)])
  visited = {start}
  
  while queue:
    node, hops = queue.popleft()
    
    if node == end:
      return hops
    
    for neighbor in graph.get(node, []):
      if neighbor not in visited:
        visited.add(neighbor)
        queue.append((neighbor, hops + 1))
          
  return -1
