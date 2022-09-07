require 'rails_helper'

RSpec.describe Mutations::JoinEvent, type: :request do
  describe '.resolve' do
    it 'joins an event' do
      @user_1 = User.create(name: "user_1")
      @user_2 = User.create(name: "user_2")
      @event_1 = Event.create!(name: "test", user_id: @user_1.id, date: DateTime.new(2023,6,23,12) )

      expect(Event.last.status).to eq(0)
      post '/graphql', params: { query: query }

      expect(Event.last.status).to eq(1)
      expect(Event.last.guest_id).to eq(@user_2.id)
    end
  end

  def query
    <<~GQL
    mutation{joinEvent(input: { eventId: #{@event_1.id}, userId: #{@user_2.id}} ) {
        event {
          userId
          guestId
          id
          name
          status
    	   }
      }
    }
    GQL
  end
end
