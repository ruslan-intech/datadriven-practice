from collections import defaultdict

def count_log_levels(log_lines: list[str]) -> list:
  statuses = defaultdict(int)
    
  for ll in log_lines:
    if ll.find('DEBUG') != -1:
      statuses['DEBUG'] += 1
    elif ll.find('INFO') != -1:
      statuses['INFO'] += 1
    elif ll.find('ERROR') != -1:
      statuses['ERROR'] += 1
    elif ll.find('WARN') != -1:
      statuses['WARN'] += 1
    else:
      statuses['UNKNOWN'] += 1
  
  if not statuses:
    return [{}, '']

  max_count_status = max(statuses.items(),  key = lambda x:(x[1]))
  
  return [statuses, max_count_status[0]]
