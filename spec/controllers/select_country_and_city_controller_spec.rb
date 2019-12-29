require 'rails_helper'

RSpec.describe SelectCountryAndCityController, type: :controller do
  let!(:malaysia) { create(:country) }
  let!(:singapore) { create(:country, name: 'SG') }

  describe 'GET #index' do
    it 'is successful' do
      get :index
      expect(response).to be_successful
    end

    context 'with params' do
      context 'user ip address country same with selected country' do
        it 'shows correct flash message' do
          get :index, params: { country: malaysia.name, city: malaysia.cities.first.name }

          aggregate_failures do
            expect(flash[:notice]).to be_present
            expect(flash[:notice]).to eq "Hello from #{ISO3166::Country[malaysia.name]}, #{malaysia.cities.first.name}."
          end
        end
      end

      context 'user ip address country different with selected country' do
        it 'shows correct flash message' do
          ActionDispatch::Request.any_instance.stub(:remote_ip).and_return('1.9.255.255')

          get :index, params: { country: singapore.name, city: singapore.cities.first.name }

          aggregate_failures do
            expect(flash[:notice]).to be_present
            expect(flash[:notice]).to eq 'Hey it looks like you are from Malaysia.'
          end
        end
      end
    end
  end
end
