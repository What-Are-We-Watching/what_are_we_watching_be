class Event < ApplicationRecord
  has_many :event_movies
  has_many :movies, through: :event_movies
  belongs_to :user

  enum status: [:open, :pending, :full]
  validates_presence_of :name
  validates_presence_of :date

  after_create do
    all_movies = (1..400).to_a.shuffle
    all_movies.each do |id|
      EventMovie.create!(event_id:Event.last.id, movie_id: id)
    end
  end
end
