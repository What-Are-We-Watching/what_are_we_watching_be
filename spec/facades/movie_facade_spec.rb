require 'rails_helper'

RSpec.describe "MovieFacade" do
  describe "get movies" do
    it "returns a set of movies as a hash" do
      facade = MovieFacade.new
      movies = facade.top_movie_seeding(1)



      expect(movies).to be_a(Array)
      expect(movies[3]).to be_a(Hash)
      expect(movies[3][:title]).to be_a(String)
      expect(movies[1][:moviedb_id]).to be_a(Integer)
      expect(movies[0][:image]).to be_a(String)
    end
  end
end
