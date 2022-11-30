Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :venues do
    resources :activities, only: [:new]
  end
  get "my_venues", to: 'venues#my_venues'
  resources :bookings
  resources :activities, except: [:new]

  # Defines the root path route ("/")
  # root "articles#index"
end
