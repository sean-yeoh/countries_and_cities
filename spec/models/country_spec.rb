require 'rails_helper'

RSpec.describe Country, type: :model do
  let(:valid_country) { create(:country) }
  let(:invalid_country) { build(:country, name: Faker::Alphanumeric.alpha(number: 10)) }

  describe '#country_name' do
    context 'valid ISO3166 country' do
      it 'returns the country name' do
        expect(valid_country.country_name).to eq 'Malaysia'
      end
    end

    context 'invalid ISO3166 country' do
      it 'returns empty string' do
        expect(invalid_country.country_name).to eq ''
      end
    end
  end
end
