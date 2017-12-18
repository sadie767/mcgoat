Rails.application.routes.draw do

  devise_for :users
  root to: "homes#index"
  resources :homes
  resources :bucks
  resources :does
  resources :juniors
  resources :abouts 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
