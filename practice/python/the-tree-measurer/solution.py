from collections import deque

def max_depth(root) -> int:
  if root is None:
    return 0
  q, depth = deque([root]), 0
  while q:
    depth += 1
    for _ in range(len(q)):
      node = q.popleft()
      if node['left']:
        q.append(node['left'])
      if node['right']:
        q.append(node['right'])
  return depth
