# frozen_string_literal: true

module Types
  class EventMovieType < Types::BaseObject
    field :id, ID, null: false
    field :event_id, Integer
    field :movie_id, Integer
    field :vote, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :image, String, null:true
    field :title, String, null:true

    def image
      object.movie.image
    end

    def title
      object.movie.title
    end
  end
end
