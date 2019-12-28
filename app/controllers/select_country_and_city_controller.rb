class SelectCountryAndCityController < ApplicationController
  def index
    @countries = Country.all.order(name: :asc)

    if params[:country].present? && params[:city].present?
      client_country_code = Geocoder.search(request.remote_ip).first.country

      if client_country_code.present? && client_country_code != params[:country]
        flash[:notice] = "Hey it looks like you are from #{ISO3166::Country[client_country_code]}."
      else
        flash[:notice] = "Hello from #{ISO3166::Country[params[:country]]}, #{params[:city]}."
      end
    end
  end
end
