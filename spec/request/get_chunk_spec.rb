require 'rails_helper'

RSpec.describe Types::UserType, type: :request do
  describe '.getChunk' do
    it 'returns a chunk' do
      user_1 = User.create(name: "user_1")
      user_2 = User.create(name: "user_2")
      Movie.create(title:"Good Movie", image:"Movie.JPG", moviedb_id:"1")
      Movie.create(title:"Great Movie", image:"Movie.JPG", moviedb_id:"2")
      Movie.create(title:"Swell Movie", image:"Movie.JPG", moviedb_id:"3")
      Movie.create(title:"OK Movie", image:"Movie.JPG", moviedb_id:"4")
      Movie.create(title:"Poor Movie", image:"Movie.JPG", moviedb_id:"5")
      Movie.create(title:"Shrek 4", image:"Movie.JPG", moviedb_id:"6")
      @event_1 = Event.create!(name: "event_1", user_id: user_1.id, guest_id: user_2.id, date: DateTime.new(2023,6,23,12) )
      post '/graphql', params: {query: query}
      json = JSON.parse(response.body)
      data = json['data']['getChunk']

      expect(data[0]['image']).to be_a(String)
      expect(data[0]['id']).to be_a(String)
      expect(data[0]['title']).to be_a(String)

    end
  end

  def  query
    <<~GQL
     query {getChunk(eventId: "#{@event_1.id}", lastMovieId: "2"){
        id
   		image
    	title
      }
     }
    GQL
  end
end
