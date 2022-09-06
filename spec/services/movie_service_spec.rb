RSpec.describe "Movie Service" do
  it 'returns movie data' do
    service = MovieService.new
  	data = service.top_movies(3)

    expect(data[0]).to have_key(:poster_path)
    expect(data[0]).to have_key(:title)


  end
end
