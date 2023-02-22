Rails.application.routes.draw do
  root to:'users#index'
  get 'rooms/index'
  get 'rooms/new/:id'=> 'rooms#new',as:'rooms_new'
  get 'users/index'
  get 'reservations/new'
  get 'reservations/index'
  get 'reservations/show'
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :reservations
  resources :rooms 

end

