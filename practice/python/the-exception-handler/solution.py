def safe_divide_batch(pairs: list) -> list:
  # pairs: list of [numerator, denominator]
  # Return float result, 'division by zero', or 'invalid input'
  output = []
  for p0, p1 in pairs:
    if (isinstance(p0, str) or isinstance(p1, str)):
      output.append("invalid input")
    elif p1 == 0:
      output.append("division by zero")
    else:
      expr = p0 / p1
      output.append(expr)
 
  return output
