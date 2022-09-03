class Movie < ApplicationRecord
  has_many :event_movies
  has_many :events, through: :event_movies
  # has_one_attached :image

  validates_presence_of :title,
                        :image,
                        :moviedb_id
end
