Rails.application.routes.draw do
  root to:'users#index'
  get 'rooms/index'
  
  get 'users/index'
  get 'reservations', to: 'reservations#index'
  post 'reservations/show', to: 'reservations#show'
  get 'room/show'
  

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :reservations
  resources :rooms 

end

