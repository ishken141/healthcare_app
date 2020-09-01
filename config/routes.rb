Rails.application.routes.draw do
  get 'messages/create'
  get 'messages/destroy'
  devise_for :users
  root "rooms#index" 
  resources :rooms, only: [:index, :show]  
  resources :users, only: :show do 
    resources :profiles, only: [:edit, :update]   
    resources :messages, only: [:create, :destroy]
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
