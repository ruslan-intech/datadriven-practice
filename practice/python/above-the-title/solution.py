def actor_genre_box_office(movies: list[dict], 
    actors: list[dict], 
    mapping: list[dict], 
    genre: str, 
    min_rating: float) -> dict:
  items = {}
  for m in movies:
    if m.get('genre', '') == genre and m.get('rating', 0) >= min_rating:
      box_office =  m['box_office']
      movie_id = m['movie_id']
      
      for mp in mapping:        
        if mp.get('movie_id', -1) == movie_id:
          actor_id = mp.get('actor_id', 0)

          for a in actors:
            if a.get('actor_id', 0) == actor_id:
                  items[a['name']] = items.get(a['name'], 0) + box_office

  return items
