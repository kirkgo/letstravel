Rails.application.routes.draw do
  resources :passengers
  resources :cities
  devise_for :users
  resources :buses
  resources :trips, only: :index
  root "trips#index"
end
