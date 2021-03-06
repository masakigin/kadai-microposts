Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  get 'relationships/create'

  get 'relationships/destroy'

  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :"likes", to: "likes#index"
      
    end
  end

  resources :microposts, only: [:create, :destroy] do
    member do
      post "likes", to: "likes#create"
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:index, :create, :destroy]
end