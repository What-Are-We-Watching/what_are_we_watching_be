class EventMoviesController < ApplicationController
  before_action :set_event_movie, only: %i[ show update destroy ]

  # GET /event_movies
  # GET /event_movies.json
  def index
    @event_movies = EventMovie.all
  end

  # GET /event_movies/1
  # GET /event_movies/1.json
  def show
  end

  # POST /event_movies
  # POST /event_movies.json
  def create
    @event_movie = EventMovie.new(event_movie_params)

    if @event_movie.save
      render :show, status: :created, location: @event_movie
    else
      render json: @event_movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_movies/1
  # PATCH/PUT /event_movies/1.json
  def update
    if @event_movie.update(event_movie_params)
      render :show, status: :ok, location: @event_movie
    else
      render json: @event_movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_movies/1
  # DELETE /event_movies/1.json
  def destroy
    @event_movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_movie
      @event_movie = EventMovie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_movie_params
      params.require(:event_movie).permit(:event_id, :movie_id, :vote)
    end
end
