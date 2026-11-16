def filter_integers(items: list) -> list[int]:
  out = [ x for x in items if type(x) is int ]
  return out
