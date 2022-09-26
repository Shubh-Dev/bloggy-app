Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :posts
  resources :users
  # Defines the root path route ("/")
  
end
