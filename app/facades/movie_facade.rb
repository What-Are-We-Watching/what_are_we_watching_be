class MovieFacade
  def top_movie_seeding(page)
    service = MovieService.new
    service.top_movies(page).each do |movie_info|
      binding.pry
      Movie.new(movie_info)
    end
  end


end
