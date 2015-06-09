Rails.application.routes.draw do
  root 'flights#index'
  get 'flights' => 'flights#index'
  get 'book' => 'bookings#new'
end
