require 'rails_helper'

RSpec.describe 'Units API', type: :request do
  describe "GET units/si" do
    context 'valid input' do
      let(:valid_attributes) { { units: 'degree/minute' } }

      before do
        get '/units/si', params: valid_attributes
      end

      it 'should convert units' do
        expect(JSON.parse(response.body)['unit_name']).to eq('rad/s')
      end

      it 'should give the correct multiplication_factor' do
        expect(JSON.parse(response.body)['multiplication_factor']).to eq(0.00029088820867)
      end
    end

    context 'invalid input' do
      let(:invalid_attributes) { { units: "abcdefg"} }

      before do
        get '/units/si', params: invalid_attributes
      end

      it 'should 400' do
        expect(response.status).to eq 400
      end
    end
  end
end