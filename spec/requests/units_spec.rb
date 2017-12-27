require 'rails_helper'

RSpec.describe 'Units API', type: :request do
  describe "GET units/si" do
    context 'given example' do
      let(:valid_attributes) { { units: 'degree/minute' } }

      before { get '/units/si', params: valid_attributes }

      it 'should convert units' do
        expect(json['unit_name']).to eq('rad/s')
      end

      it 'should give the correct multiplication_factor' do
        expect(json['multiplication_factor']).to eq(0.00029088820867)
      end
    end
  end
end