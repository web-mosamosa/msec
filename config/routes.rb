Rails.application.routes.draw do

  

  resources :categories

  devise_for :users

  resources :users
  
  resources :carts, only: [:index,:show]
  
  resources :categories

  resources :residences

  namespace  :admin do
   resources :items
   get '/top' => 'items#top'
  end
  resources :items, only: [:index,:show]
  root to: 'items#top'
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

end
