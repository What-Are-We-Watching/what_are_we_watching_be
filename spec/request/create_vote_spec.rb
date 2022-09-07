require 'rails_helper'

RSpec.describe Mutations::Vote, type: :request do
  describe '.resolve' do
    it 'increments vote number' do
      @user_1 = User.create(name: "user_1")
      @user_2 = User.create(name: "user_2")
      @movie_1 = Movie.create(title:"Good Movie", image:"Movie.JPG", moviedb_id:"1")
      @event_1 = Event.create!(name: "event_1", user_id: @user_1.id, guest_id: @user_2.id, date: DateTime.new(2023,6,23,12) )

      expect(@event_1.event_movies.first.vote).to eq(0)
      post '/graphql', params: { query: query }
      expect(@event_1.event_movies.first.vote).to eq(1)

    end
  end

  def query
    <<~GQL
    mutation {vote(input: {
            eventId: #{@event_1.id},
            movieId: #{@movie_1.id},
            vote: "true"
        }) {
        eventMovie {
            eventId
            movieId
            vote
        }
      }
    }
    GQL
  end
end
