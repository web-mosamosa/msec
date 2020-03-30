Rails.application.routes.draw do
  devise_for :users
  
  namespace  :admin do
   resources :items
   get '/top' => 'items#top'
  end
end
