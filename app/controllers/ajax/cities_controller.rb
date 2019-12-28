module Ajax
  class CitiesController < ActionController::Base
    def index
      country = Country.find_by_name(params[:country])
      cities = country ? country.cities.order(name: :asc).collect(&:name).unshift('') : ['']
      render json: cities
    end
  end
end
