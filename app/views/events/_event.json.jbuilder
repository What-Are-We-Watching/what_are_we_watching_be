json.extract! event, :id, :date, :name, :users_id, :movie_selection_id, :created_at, :updated_at
json.url event_url(event, format: :json)
