Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :file_uploads
    get '/' => 'file_uploads#index'
  end

  resources :select_country_and_city, only: :index
  root to: 'select_country_and_city#index'
end
