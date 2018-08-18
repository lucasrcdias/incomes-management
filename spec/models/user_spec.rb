require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }

    it { should have_secure_password }

    it { should allow_value('foo@bar.com').for(:email) }
    it { should allow_value('foo123@bar.com.br').for(:email) }
    it { should_not allow_value('not_an_email').for(:email) }
    it { should_not allow_value('invalid@email').for(:email) }
  end
end
