Rails.application.routes.draw do
  root to:'users#index'
  get 'rooms/index'
  get 'users/index'
  get 'reservations/new'
  get 'reservations/index'
  get 'reservations/show'
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :reservations
  resources  :rooms do
  
  collection do
    get 'search'
  end
  end

end

