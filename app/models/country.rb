class Country < ApplicationRecord
  validates :name, presence: true
  has_many :cities, dependent: :destroy

  def country_name
    ISO3166::Country[name].to_s
  rescue StandardError
    ''
  end
end
