require 'rails_helper'

RSpec.describe Mutations::CreateEvent, type: :request do
  describe '.resolve' do
    it 'creates an event' do
      @user_1 = User.create(name: "user_1")
      count = Event.count
      post '/graphql', params: { query: query }
      expect(Event.count).to eq(count + 1)
    end


    it 'does not creates an event with bad input' do
      @user_1 = User.create(name: "user_1")
      count = Event.count
      post '/graphql', params: { query: badquery }
      expect(Event.count).to_not eq(count + 1)
    end
  end

  def query
    <<~GQL
    mutation {createEvent(input:{date: "2022-09-04", name: "newevent", userId: #{@user_1.id}}){
       event {
         date
         name
         userId
       }
    }
     }
    GQL
  end

  def badquery
    <<~GQL
    mutation {createEvent(input:{date: "2022-09-04", userId: #{@user_1.id}}){
       event {
         date
         name
         userId
       }
    }
     }
    GQL
  end
end
