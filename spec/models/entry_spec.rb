require 'rails_helper'

RSpec.describe Entry, type: :model do
  context "validations" do
    it { should validate_presence_of(:value) }
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end
end
