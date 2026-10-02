class MessageFormatter:
  def sort_by_case(self, text):
    srt_lst = sorted(text, key = lambda c: 0 if c.islower() else 1 if c.isupper() else 2)    
    return ''.join(srt_lst)

def sort_by_case(text):
  mf = MessageFormatter()
  out = mf.sort_by_case(text)
  return out
    
