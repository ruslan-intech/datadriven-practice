def paginate(pages: list[list]) -> list:
  class Paging:
    def __init__(self, pages: list[list]):
      self.pages = pages
      self.page_ids = 0
      self.item_idx = 0
      
    def __iter__(self):
      return self
    
    def __next__(self):
      while self.page_ids < len(self.pages):
        page = self.pages[self.page_ids]
        if self.item_idx < len(page):
          item = page[self.item_idx]
          self.item_idx += 1
          return item
        
        self.page_ids += 1
        self.item_idx = 0
      raise StopIteration
    
  return list(Paging(pages))
