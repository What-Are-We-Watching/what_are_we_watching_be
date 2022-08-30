json.extract! movie, :id, :title, :overview, :moviedb_id, :image, :created_at, :updated_at
json.url movie_url(movie, format: :json)
