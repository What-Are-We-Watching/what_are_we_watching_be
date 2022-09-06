require 'faraday'
require 'json'

class MovieService
  def top_movies(page)
    response = conn.get("/3/movie/top_rated?&language=en-US&page=#{page}")
    json = parse_json(response)
    json[:results]
  end

  private

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params['api_key'] = ENV['tmdb_api_key']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
