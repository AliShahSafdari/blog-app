Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:new,:index, :show, :create]
      resources :likes, only: [:create]
    end
  end
end
