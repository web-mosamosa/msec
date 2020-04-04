Rails.application.routes.draw do

  devise_for :admins, skip: :all

  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  get '/users/:id/withdraw' => 'users#withdraw'
  get 'homes/thanks'
  get 'homes/about'
  resources :categories


  devise_for :users

  resources :users, only: [:edit,:show,:create,:update,:destroy]
  get 'users/:id/residences' => 'users#residence', as: 'user_residence'
  post 'users/:id/residences' => 'residences#create'

  namespace  :admin do
   resources :users
   resources :items
   resources :categories
   get '/top' => 'items#top'
  end

  resources :carts, only: [:index, :create, :update, :destroy]



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
