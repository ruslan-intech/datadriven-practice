def manual_sort(nums):
  out = []

  while nums:
    min_ = 10**18
    for n in nums:
      if n < min_:
        min_ = n
    
    cnt = nums.count(min_)
    for _ in range(cnt):
      out.append(min_)
      index = nums.index(min_)
      del nums[index]
      
  return out
