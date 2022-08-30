require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { should validate_presence_of :date }
    it { should validate_presence_of :name }
  end
  describe "relationships" do
    it { should belong_to :user }
    it { should have_many :event_movies }
    it { should have_many(:movies).through(:event_movies)}
  end
end