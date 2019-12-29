require 'rails_helper'

RSpec.describe Ajax::CitiesController, type: :controller do
  let!(:malaysia) { create(:country) }

  describe 'GET #index' do
    context 'with valid country' do
      it 'returns cities of that country' do
        get :index, params: { country: malaysia.name }
        expect(response.body).to eq malaysia.cities.order(name: :asc).collect(&:name).unshift('').to_json
      end
    end

    context 'with invalid country' do
      it 'returns array with empty string' do
        get :index, params: { country: Faker::Alphanumeric.alpha(number: 10) }
        expect(response.body).to eq [''].to_json
      end
    end
  end
end
