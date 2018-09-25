require 'rails_helper'

RSpec.describe EntryService, type: :service do
  describe "#new" do
    let(:category) { create(:category) }
    let(:params) { { value: 150.0, description: 'Entry description', category: category } }

    context "when added_at is empty" do
      before { allow(DateTime).to receive(:now).and_return('2018-09-25T00:37:33+00:00') }

      it "should set added_at to DateTime.now" do
        entry = EntryService.new(params)

        expect(entry.added_at).to eq('2018-09-25T00:37:33+00:00')
      end
    end

    context "when added_at is not empty" do
      it "should use passed value" do
        entry = EntryService.new(params.merge({ added_at: '2018-05-24T00:37:33+00:00' }))

        expect(entry.added_at).to eq('2018-05-24T00:37:33+00:00')
      end
    end
  end
end
