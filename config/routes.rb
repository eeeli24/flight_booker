Rails.application.routes.draw do
  root 'flights#index'
  get 'flights' => 'flights#index'
  # get 'booking' => 'bookings#new'
  # post 'booking' => 'bookings#create'
  resources :bookings, only: [:new, :create, :show]
end
