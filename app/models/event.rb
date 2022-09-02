class Event < ApplicationRecord
  has_many :event_movies
  has_many :movies, through: :event_movies
  belongs_to :user

  enum status: [:open, :pending, :full]
  validates_presence_of :name
  validates_presence_of :date
  
end
