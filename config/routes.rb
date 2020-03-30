Rails.application.routes.draw do
  
  resources :categories
  devise_for :users
  resources :carts
  
  namespace  :admin do
   resources :items
   get '/top' => 'items#top'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users 

end
