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
end
