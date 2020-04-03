Rails.application.routes.draw do
  get '/users/:id/withdraw' => 'users#withdraw'
  
  get 'homes/thanks'
  get 'homes/about'
  
    devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'    
  end

  resources :categories

  devise_for :users


  resources :users, only: [:edit,:show,:update,:destroy] do
    resources :orders, only: [:new,:create]
    resources :order_items, only: [:index,:show]
    resources :residences
  end



  
  resources :carts, only: [:index,:show]
  

  resources :categories

 



  namespace  :admin do
   resources :users
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
