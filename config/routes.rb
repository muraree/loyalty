Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  resources :users, only: [:index]


  root "users#index"
  resources :bills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
