require 'rails_helper'

RSpec.describe Fibonacci, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:result) }
    it { is_expected.to validate_presence_of(:runtime) }

    it { is_expected.to validate_numericality_of(:value) }
    it { is_expected.to validate_numericality_of(:result) }
    it { is_expected.to validate_numericality_of(:runtime) }
  end

  describe 'scopes' do
    context 'when filtering for the last 10 records' do
      subject(:results) { described_class.last_ten }
      let!(:fibonacci) { create(:fibonacci, created_at: 1.days.from_now, value: 60) }

      before do
        create_list(:fibonacci, 13)
      end

      it 'only includes users who have signed in within the past 2 months' do
        expect(results.first).to eql(fibonacci)
      end
    end
  end
end
