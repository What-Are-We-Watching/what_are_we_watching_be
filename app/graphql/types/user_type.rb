# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String , null: false
    field :events, [Types::EventType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    
    # methods can also be fields:
  # field :method_name, Response_data_type, null: T/F
  end
end