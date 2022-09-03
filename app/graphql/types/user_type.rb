# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :events, [Types::EventType], null: true
    field :invited_events, [Types::EventType], null: true


    def invited_events
      Event
      .where(guest_id: object.id)
    end
  end
end
