Rails.application.routes.draw do
  root to: 'users#index'
  
  devise_for :users

  resources :users
  
  resources :carts
  
  resources :categories

  resources :residences
 
  namespace  :admin do
   resources :items
   get '/top' => 'items#top'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

end
