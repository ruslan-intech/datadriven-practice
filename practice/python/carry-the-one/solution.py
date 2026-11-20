def borrow_positions(a, b):
  res = []
  borrow = 0
  for i in range(len(a)):
    bi = b[i] if i < len(b) else 0
    if a[i] - bi - borrow < 0:
      res.append(i)
      borrow = 1
    else:
      borrow = 0
  return res
