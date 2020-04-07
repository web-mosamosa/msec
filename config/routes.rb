Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  get 'homes/about'
  resources :categories


  devise_for :users, skip: [:sessions],
  :controllers => {
    :registrations => 'users/registrations',
  } 
   devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    get '/sign_out' => 'devise/sessions#destroy', as: 'destroy_user_session'
  end

  resources :users, only: [:edit,:show,:create,:update,:destroy]
  get 'users/:id/residences' => 'users#residence', as: 'user_residence'
  post 'users/:id/residences' => 'residences#create'
  devise_scope :user do
  get 'users/:id/password' => 'users/registrations#edit', as: 'passwordchange'
get 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
end
  namespace  :admin do
   resources :users
   resources :items
   resources :categories
   resources :orders,only: [:index, :show, :update]
   resources :order_items,only: [:update]
   get '/top' => 'items#top'
  end
get 'admin/user/:id/orders' => 'admin/orders#userindex', as: 'user_orders'
  resources :carts, only: [:index, :create, :update, :destroy]
   delete 'destroy_all' => 'carts#destroy_all',as:'destroy_all_carts'
   delete 'destroy_item' => 'carts#destroy_item',as:'destroy_item'


  resources :users, only: [:edit,:show,:update,:destroy]
  get "orders/confirm" => "orders#confirm"
  get 'homes/thanks'
  resources :orders, only: [:new, :index, :show, :create]
  

  resources :residences

  resources :items, only: [:index,:show]
  root to: 'items#top'
mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
