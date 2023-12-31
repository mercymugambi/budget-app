Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  # resources :users, only: [:index, :destroy]
  
  resources :groups do 
    resources :payments_entities, only: [:index, :new, :create]
  end
end
