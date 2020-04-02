Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  get 'homes/about'
  resources :categories
  devise_for :users

  namespace  :admin do
   resources :users
   resources :items
   get '/top' => 'items#top'
  end



  resources :users, only: [:edit,:show,:update,:destroy]

  resources :orders
  get "orders/confirm" => "orders#confirm"
  get 'homes/thanks'

  resources :residences
  resources :carts, only: [:index,:show]

  resources :items, only: [:index,:show]
  root to: 'items#top'
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
