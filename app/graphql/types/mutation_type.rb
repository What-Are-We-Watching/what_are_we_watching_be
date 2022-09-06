module Types
  class MutationType < Types::BaseObject
  

    field :create_event, mutation: Mutations::CreateEvent
    field :create_user, mutation: Mutations::CreateUser
    field :join_event, mutation: Mutations::JoinEvent
    field :vote, mutation: Mutations::Vote
  end
end
