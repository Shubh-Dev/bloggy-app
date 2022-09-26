Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :posts, only: [:index, :show]
  resources :users, only: [:index, :show]
  # Defines the root path route ("/")
  
end
