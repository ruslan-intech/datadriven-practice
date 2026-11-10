def transpose_matrix(matrix: list) -> list:
  if not matrix:
    return []
  
  m = len(matrix)
  n = len(matrix[0])
  
  out = [[0] * m for _ in range(n)]
  
  for i in range(n):
    for j in range(m):
      out[i][j] = matrix[j][i]
  
  return out
