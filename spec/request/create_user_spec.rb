require 'rails_helper'

RSpec.describe Mutations::CreateUser, type: :request do
  describe '.resolve' do
    it 'joins an event' do
      @user_1 = User.create(name: "user_1")
      @user_2 = User.create(name: "user_2")

      count = User.count
      post '/graphql', params: { query: query }
      expect(User.count).to eq(count + 1)

    end
  end

  def query
    <<~GQL
    mutation {createUser( input:{name: "Proebstel" }) {
      user {
        id
        name
      }
    }
    }
    GQL
  end
end
