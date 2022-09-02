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

    field :events,
    [Types::EventType],
    null: false,
    description: "Return a list of events"

    def events
      Event.all
    end
  end
end
