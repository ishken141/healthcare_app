Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  root "rooms#index" 
  resources :rooms, only: [:index, :show]  
  resources :users, only: :show do 
    resources :profiles, only: [:edit, :update]   
    resources :messages, only: [:create, :destroy] 
    resources :likes, only: [:create, :destroy]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
