from collections import Counter
def dice_roll_scoring(dice: list[int]):
  
  cntr = Counter(dice)
  
  sort_cnt = sorted([v for k, v in cntr.items()], reverse = True)
  
  if sort_cnt[0] == 5:
    return 50
  elif sort_cnt[0] == 4:
    return 40
  elif sort_cnt[0] == 3 and sort_cnt[1] == 2:
    return 25
  else:
    return sum(dice)
