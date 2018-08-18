require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }
  let!(:income_category)  { create(:category, kind: Category.kinds[:income], user: subject) }
  let!(:expense_category) { create(:category, kind: Category.kinds[:expense], user: subject) }

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }

    it { should have_secure_password }

    it { should allow_value('foo@bar.com').for(:email) }
    it { should allow_value('foo123@bar.com.br').for(:email) }
    it { should_not allow_value('not_an_email').for(:email) }
    it { should_not allow_value('invalid@email').for(:email) }
  end

  context "associations" do
    it { should have_many(:categories) }
    it { should have_many(:entries) }
  end

  context "methods" do
    describe "incomes" do
      before do
        5.times do
          create(:entry, category: income_category, value: 50, user: subject)
        end
      end

      it "should return 250" do
        expect(subject.incomes).to eq(250.0)
      end
    end

    describe "expenses" do
      before do
        5.times do
          create(:entry, category: expense_category, value: 50, user: subject)
        end
      end

      it "should return 250" do
        expect(subject.expenses).to eq(250.0)
      end
    end
  end
end
