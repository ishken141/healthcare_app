Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root "rooms#index" 
  resources :rooms, only: [:index, :show]  do 
  resources :messages, only: [:create, :destroy]  
  end 
  resources :users, only: :show do 
    resources :profiles, only: [:edit, :update]   
    resources :likes, only: [:create, :destroy]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
