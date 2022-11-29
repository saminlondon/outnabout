Rails.application.routes.draw do
  devise_for :users
  root to: "activities#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :activities
  resources :venues
  get "my_venues", to: 'venues#my_venues'
  resources :bookings

  # Defines the root path route ("/")
  # root "articles#index"
end
