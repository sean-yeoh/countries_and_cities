Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :file_uploads
    get '/' => 'file_uploads#index'
  end
end
