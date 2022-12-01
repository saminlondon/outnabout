Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :activities do
    resources :bookings, except: :index
  end

  resources :venues do
    resources :activities, only: :new
  end
  get 'all_activities', to: 'activities#all_activities'


  resources :bookings, only: :index

  get "my_venues", to: 'venues#my_venues'


  # Defines the root path route ("/")
  # root "articles#index"
end

# resources :activities do
#   resources :bookings, except: :index
# end
