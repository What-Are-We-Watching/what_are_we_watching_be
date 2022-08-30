class EventMovie < ApplicationRecord
  belongs_to :event
  belongs_to :movie

  validates_presence_of :vote
  
end
