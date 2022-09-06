require 'rails_helper'

RSpec.describe "MovieFacade", type: :facade do
  describe "get movies" do
    xit "returns a set of movies as a hash" do
      movies = MovieFacade.top_movie_seeding(1)

      # expect(movies).to be_a(Movie)
      expect(movies).to be_a(Hash)
    end
  end
end