require 'rails_helper'

RSpec.describe Movie, type: :model do
  xit 'exists and has attributes' do
    movie_data = {
      id: 278,
      poster_path: '/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
      original_title: 'The Shawshank Redemption'
    }
    movie = Movie.new(movie_data)

    expect(movie).to be_a(Movie)
    expect(movie).to respond_to(:title, :image, :moviedb_id)
  end
end
