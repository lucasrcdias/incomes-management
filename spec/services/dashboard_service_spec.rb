require 'rails_helper'

RSpec.describe DashboardService, type: :service do
  describe "#entries" do
    let(:user)  { create(:user) }
    let(:year)  { 2018 }
    let(:month) { 9 }

    before do
      3.times do |i|
        create(:entry, user: user, added_at: DateTime.parse("2018-09-#{25 + i}T00:37:33+00:00"))
      end

      create(:entry, user: user, added_at: DateTime.now + 10.days)
    end

    it "should list user entries correctly" do
      entries = DashboardService.entries(month, year, user)

      expect(entries.count).to eq(3)
      expect(entries.first.added_at.to_s).to eq('2018-09-27 00:37:33 UTC')
      expect(entries.second.added_at.to_s).to eq('2018-09-26 00:37:33 UTC')
      expect(entries.last.added_at.to_s).to eq('2018-09-25 00:37:33 UTC')
    end
  end
end
