Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'flights#index'

  resources :airports

  resources :flights

  resources :bookings

  resources :passengers

end
