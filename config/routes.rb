Rails.application.routes.draw do

  resources :categories

  devise_for :users

  resources :users, only: [:edit,:show,:create,:update,:destroy]

  resources :carts

  resources :categories

  resources :residences

  namespace  :admin do
   resources :items
   get '/top' => 'items#top'
  end
  resources :items, only: [:index,:show]
  root to: 'items#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
