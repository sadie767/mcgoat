Rails.application.routes.draw do

  devise_for :users
  root to: "homes#index"
  resources :homes
  resources :bucks
  resources :does
  resources :juniors
  resources :bucks_awards, :except => [:show, :index]
  resources :does_awards, :except => [:show, :index]
  resources :juniors_awards, :except => [:show, :index]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
