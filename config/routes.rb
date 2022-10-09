Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root "users#index"

  resources :users, only: [:index, :show, :create, :new] do
  resources :posts, on:  :show, only: [:index, :show, :create, :new]
  end
  # resources :posts, only: [:new, :create] do
  #   resources :comments, only: [:create]
  #   resources :likes, only: [:create]
  #  end
  
  # Defines the root path route ("/")
  

  # post '/users/:user_id/posts', to: 'posts#create', as: 'create_user_post'
  # post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'create_post_like'
  # get '/posts/:post_id/comments/new', to: 'comments#new', as: 'new_post_comment'
  # post '/posts/:post_id/comments', to: 'comments#create', as: 'create_post_comment'
  
end
