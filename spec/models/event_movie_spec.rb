require 'rails_helper'

RSpec.describe EventMovie, type: :model do
    describe "validations" do
    it { should validate_presence_of :vote }

  end
  describe "relationships" do
    it { should belong_to :event }
    it { should belong_to :movie }
  end
end
