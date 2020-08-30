Rails.application.routes.draw do
  get 'profiles/edit'
  devise_for :users
  root "rooms#index" 
  resources :rooms, only: :index  
  resources :users, only: :show 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
