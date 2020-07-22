require "rails_helper"

RSpec.describe "Fibonacci Sequence", type: :request do

  let!(:fibonaccis) { create_list(:fibonacci, 15) }
  let!(:fibonacci) { create(:fibonacci, created_at: 1.days.from_now) }

  describe 'GET /fibonacci.json' do
    context 'when retrieving the right set of data' do
      before { get '/fibonacci.json' }

      it 'should have the right respose code' do
        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:ok)
      end

      it 'should have data' do
        expect(json).not_to be_empty
      end

      it 'should return only ten records' do
        expect(json.size).to eq(10)
      end

      it 'should order the data correctly' do
        expect(json.first['value']).to eql(fibonacci.value)
      end
    end
  end

  describe 'POST /fibonacci.json' do
    context 'when position is given' do
      let(:position) { 10 }
      let(:expected_result) { 55 }

      before { post '/fibonacci.json', params: { n: position } }

      it 'should have the right response code and type' do
        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:created)
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

      it 'should create one record with the values' do
        expect(Fibonacci.count).to eq(17)
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
