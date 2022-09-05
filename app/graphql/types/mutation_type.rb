module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :create_event, mutation: Mutations::CreateEvent
    field :create_user, mutation: Mutations::CreateUser
    field :join_event, mutation: Mutations::JoinEvent
    field :vote, mutation: Mutations::Vote
  end
end
