class SelectCountryAndCityController < ApplicationController
  def index
    @countries = Country.all.order(name: :asc)
    if params[:country].present? && params[:city].present?
      flash[:notice] = "Hello from #{ISO3166::Country[params[:country]]}, #{params[:city]}."
    end
  end
end
