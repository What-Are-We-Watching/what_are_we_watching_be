module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :event_movies, [Types::EventMovieType], null: false do
      argument :user_id, ID1
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
