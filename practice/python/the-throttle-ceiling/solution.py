class RateLimiter:
  def __init__(self, max_requests: int, window_seconds: float):
    self.max_requests = max_requests
    self.window_seconds = window_seconds
    self.request_count = 0
    self.window = 0
    
    self.accepted = []
    
  def is_allowed(self, timestamp: float) -> bool:
    fresh = []
    for old in self.accepted:
      if timestamp - old < self.window_seconds:
        fresh.append(old)
    self.accepted = fresh
    
    if len(self.accepted) >= self.max_requests:
      return False
    
    self.accepted.append(timestamp)
    return True
    
        
def run_rate_limiter(calls, max_requests, window_seconds):
  limiter = RateLimiter(max_requests, window_seconds)
  result = []
  for t in calls:
    result.append(limiter.is_allowed(t))
  return result
  
