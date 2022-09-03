class MovieFacade
  def top_movie_seeding(page)
    service = MovieService.new
    service.top_movies(page).map do |movie_info|
      {:title => movie_info[:original_title], :moviedb_id => movie_info[:id], :image => movie_info[:poster_path]}
    end
  end


end
