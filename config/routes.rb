Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: [:create]
  end

  resources :plants, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
