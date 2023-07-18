Rails.application.routes.draw do
  root "posts#index"
  # get 'posts/:id', to: 'posts#show', as: 'post'
  # get 'posts', to: 'posts#index'
  # get 'posts/new', to: 'posts#new', as: 'new_post'
  # get 'posts/:id/show', to: 'posts#show'
  # post 'posts/create', to: 'posts#create'
  # get 'posts/:id/edit', to: 'posts#edit', as:"edit_post"
  # patch 'posts/:id', to: 'posts#update'
  # delete 'posts/:id', to: 'posts#destroy'
  resources :posts
  resources :users
  get 'login', to: 'users#login', as: 'login'
  post 'login', to: 'users#log'
end 
