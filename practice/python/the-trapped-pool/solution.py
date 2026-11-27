def trap_rain_water(heights):
  out = 0
  for i in range(1, len(heights)-1):
    max_left = max(heights[:i])
    max_right = max(heights[i+1:])
    out += max(min(max_left, max_right) - heights[i], 0)
    
  return out
