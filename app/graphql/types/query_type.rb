module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :event_movies, [Types::EventMovieType], null: false do
    #   argument :user_id, user_id, required: true
    #   argument :event_id, event_id, required: true
    # end
    #
    # def event_movies(user_id, event_id)
    #   binding.pry
    # end
    field :test_chunk, [Types::MovieType], null: false do
    end

    def test_chunk
      Movie.where(id:5..15)
    end

    field :get_chunk, [Types::EventMovieType], null: false do
      argument :event_id, ID, required: true
      argument :last_movie_id, ID, required: true
    end

    def get_chunk(event_id:, last_movie_id:)
      Event.find(event_id.to_i)
      .event_movies
      .where(movie_id: last_movie_id.to_i .. last_movie_id.to_i + 6)
      # .where(id: last_movie_id..(last_movie_id.to_i+6))

    end

    field :events,
    [Types::EventType],
    null: false,
    description: "Return a list of events"

    def events
      Event.all
    end
  end
end
