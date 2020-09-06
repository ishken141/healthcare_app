Rails.application.routes.draw do
  resources :relationships, only: [:create, :destroy]
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root "rooms#index" 
  resources :rooms, only: [:index, :new, :create, :destroy, :show]  do 
  resources :messages, only: [:create, :destroy]  
  end 
  resources :users, only: :show do 
    resources :profiles, only: [:edit, :update]   
    resources :rooms, only: [:index, :new, :create, :destroy, :show]  do 
    resources :messages, only: [:create, :destroy]  
    end 
    resources :stores
    member do 
    get :followings, :followers
    end 
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
