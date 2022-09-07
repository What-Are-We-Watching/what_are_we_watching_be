require 'rails_helper'

RSpec.describe Types::EventType, type: :request do
  describe '.events' do
    it 'returns all events' do
      user_1 = User.create(name: "user_1")
      user_2 = User.create(name: "user_2")

      event_1 = Event.create!(name: "event_1", user_id: user_1.id, guest_id: user_2.id, date: DateTime.new(2023,6,23,12) )
      event_2 = Event.create!(name: "event_2", user_id: user_2.id, guest_id: user_1.id, date: DateTime.new(2023,6,23,12) )
      post '/graphql', params: {query: query}
      json = JSON.parse(response.body)
      data = json['data']['events']

      expect(data[0]['name']).to eq("event_1")
      expect(data[0]['date']).to eq("2023-06-23T12:00:00Z")
      expect(data[1]['userId']).to eq(user_2.id)
      expect(data[1]['guestId']).to eq(user_1.id)
    end
  end

  def  query
    <<~GQL
    {
      events {
        name
        date
        status
        userId
        guestId
        movieSelectionId
      }
    }
GQL
end
end
