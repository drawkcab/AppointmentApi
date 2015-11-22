Rails.application.routes.draw do
  root 'appointment#index'
  resources :appointments
end
