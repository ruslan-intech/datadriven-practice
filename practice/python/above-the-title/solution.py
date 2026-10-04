def actor_genre_box_office(movies: list[dict], 
    actors: list[dict], 
    mapping: list[dict], 
    genre: str, 
    min_rating: float) -> dict:
  
  names = { a['actor_id']: a['name'] for a in actors}
  good_movies = {
    m['movie_id']: m['box_office']
    for m in movies
    if m['genre'] == genre and m['rating'] >= min_rating
  }
  
  totals = {}
  for mp in mapping:
    movie_id, actor_id = mp['movie_id'], mp['actor_id']
    if movie_id in good_movies and actor_id in names:
      name = names[actor_id]
      totals[name] = totals.get(name, 0) + good_movies[movie_id]
      
  return totals
