require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:kind) }
    it { should validate_presence_of(:icon) }

    context "when kind is expense" do
      before { allow(subject).to receive(:expense?).and_return(true) }

      it { should validate_presence_of(:planned) }
    end

    context "when kind is income" do
      before { allow(subject).to receive(:income?).and_return(true) }

      it { should_not validate_presence_of(:planned) }
    end
  end

  context "associations" do
    it { should belong_to(:user) }
  end
end
