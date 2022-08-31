require 'rails_helper'

RSpec.describe Movie, type: :model do
    describe "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :overview}
    it { should validate_presence_of :image}
    it { should validate_presence_of :moviedb_id}
  end
  describe "relationships" do
    it { should have_many :event_movies }

  end
end

