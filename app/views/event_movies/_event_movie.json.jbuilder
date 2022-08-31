json.extract! event_movie, :id, :events_id, :movies_id, :vote, :created_at, :updated_at
json.url event_movie_url(event_movie, format: :json)
