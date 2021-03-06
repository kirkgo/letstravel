Rails.application.routes.draw do
  get 'tickets' => 'tickets#index'
  get 'refund'  => 'tickets#refund'
  resources :credit_cards
  resources :bookings
  resources :passengers
  resources :cities
  devise_for :users
  resources :buses
  resources :trips, only: :index
  root 'trips#index'
end
