Rails.application.routes.draw do
  devise_for :users
  resources :endpoints
  get 'endpoints/edit_single_field/:id', to: 'endpoints#edit_single_field', as: 'edit_single_field_endpoint'

  resources :payloads

  root "static#home"
end
