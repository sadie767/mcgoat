Rails.application.routes.draw do

  devise_for :users
  root to: "homes#index"
  resources :homes
  resources :bucks do
    resources :bawards, :except => [:show, :index]
  end

  resources :does do
    resources :dawards, :except => [:show, :index]
  end

  resources :juniors do
    resources :jawards, :except => [:show, :index]
  end
<<<<<<< HEAD

=======
  
  resources :order_items
>>>>>>> new_branch
  resources :products
  resource :cart, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
