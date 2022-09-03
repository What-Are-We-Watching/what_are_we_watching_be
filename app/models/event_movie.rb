class EventMovie < ApplicationRecord
  belongs_to :event
  belongs_to :movie

  def image
    self.movie.image
  end

end
