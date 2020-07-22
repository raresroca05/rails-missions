require "rails_helper"

RSpec.describe "Fibonacci Sequence", type: :request do

  describe 'POST /fibonacci.json' do

    context 'when position is given' do
      let(:position) { 10 }
      let(:expected_result) { 55 }

      before { post '/fibonacci.json', params: { n: position } }

      it 'should have the right response code and type' do
        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:ok)
      end

      it 'should have the right keys' do
        expect(json).to have_key('value')
        expect(json).to have_key('result')
        expect(json).to have_key('runtime')
      end

      it 'should have the right values' do
        expect(json['value']).to eql(position.to_s)
        expect(json['result']).to eql(expected_result)
        expect(json['runtime']).to be_present
      end
    end

    context 'position is not given' do
      let(:position) { nil }

      before { post '/fibonacci.json', params: { n: position } }

      it 'should have the right response code' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'should have the right key' do
        expect(json).to have_key('error')
      end

      it 'should have the right error message' do
        expect(json['error']).to eql('Please specify the position of the element you want to retrieve from the sequence!')
      end
    end
  end
end
