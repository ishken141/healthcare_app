Rails.application.routes.draw do
  get 'home/index'
  resources :relationships, only: [:create, :destroy]
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root "home#index" 
  resources :rooms, only: [:index, :new, :create, :destroy, :show]  do 
  resources :messages, only: [:create, :destroy]  
  collection do 
    get "search" 
  end 
  end 
  resources :users, only: :show do 
    resources :profiles, only: [:edit, :update]   
    resources :rooms, only: [:index, :new, :create, :destroy, :show]  do 
    resources :likes, only: [:create, :destroy]
    resources :messages, only: [:create, :destroy]  
    end 
    resources :stores
    member do 
    get :followings, :followers, :count 
    end 
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
