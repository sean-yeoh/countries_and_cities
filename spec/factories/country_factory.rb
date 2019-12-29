FactoryBot.define do
  factory :country do
    name { 'MY' }

    transient do
      cities_count { 5 }
    end

    after(:create) do |country, evaluator|
      create_list(:city, evaluator.cities_count, country: country)
    end
  end
end
