from collections import defaultdict

def anagram_groups(words: list) -> list:
  groups = defaultdict(list)
  for w in sorted(words):
    sorted_w = sorted(w)
    groups[''.join(sorted_w)].append(w)
    
  return list(groups.values())
