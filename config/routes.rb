Rails.application.routes.draw do
  devise_for :users

  
  namespace  :admin do
   resources :items
   get '/top' => 'items#top'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users 

end
