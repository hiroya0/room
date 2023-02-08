Rails.application.routes.draw do
  get 'rooms/index'
  get 'users/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources  :rooms
end
