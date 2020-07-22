require 'rails_helper'

RSpec.describe FibonacciPositionService do
  describe '#call' do
    subject(:result) { described_class.new(position).call }

    context 'when the position is provided range' do
      let(:position) { 10 }
      let(:expected_result) { 55 }

      it 'should return the right value' do
        expect(result.first).to eql(expected_result)
      end
    end

    context 'when the position is not provided' do
      let(:position) { nil }

      it 'raises an error' do
        error_message = 'Please specify the position of the element you want to retrieve from the sequence!'

        expect { result }.to raise_error(error_message)
      end
    end
  end
end
