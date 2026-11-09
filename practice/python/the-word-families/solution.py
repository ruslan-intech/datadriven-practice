from collections import defaultdict

def anagram_groups(words: list) -> list:
  w_dict = defaultdict(list)
  for w in words:
    w_sorted = ''.join(sorted(w[:]))
    w_dict[w_sorted].append(w)
    
  out = [sorted(val) for _, val in w_dict.items()]

  return sorted(out)
