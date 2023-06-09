Rails.application.routes.draw do

  devise_for :users

  resources :groups do
    resources :entities, only: [:create, :update, :destroy, :edit, :new]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
end
