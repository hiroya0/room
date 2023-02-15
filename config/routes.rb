Rails.application.routes.draw do
  root to:'users#index'
  get 'rooms/index'
  get 'users/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources  :rooms do
    resources :reservations


  collection do
    get 'search'
  end
  

  
end
end
