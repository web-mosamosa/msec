Rails.application.routes.draw do
  root to: 'items#top'

  resources :categories

  devise_for :users

  resources :users, only: [:edit,:show,:create,:update,:destroy]

  resources :carts, only: [:show]

  resources :categories

  resources :residences

  namespace  :admin do
   resources :items
   get '/top' => 'items#top'
  end
  resources :items, only: [:index,:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
