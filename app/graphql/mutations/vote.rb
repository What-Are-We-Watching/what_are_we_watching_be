class Mutations::Vote < Mutations::BaseMutation
  argument :event_id, Integer, required: true
  argument :movie_id, Integer, required: true
  argument :vote, String, required: true

  field :event_movie, Types::EventMovieType, null: false
  field :errors, [String], null: false

  def resolve(event_id:, movie_id:, vote:)
    movie = EventMovie.find_by(event_id: event_id, movie_id: movie_id)
    if vote == 'true'
      movie.vote += 1
      movie.save
      { event_movie: movie, errors: [] }
    elsif vote == 'false'
      { event_movie: movie, errors: [] }
    else
      { event: nil, errors: event.errors.full_messages }
    end
  end
end
