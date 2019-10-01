Rails.application.routes.draw do
  resources :pros
  resources :prestations
  resources :pro_prestations
  resources :booking_prestations
  resources :bookings


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
