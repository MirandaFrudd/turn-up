Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/index_restaurant", to: "pages#index_restaurant"
  get "/index_bar", to: "pages#index_bar"
  get "/index_activity", to: "pages#index_activity"
  resources :pages, only: [:index, :profile]
  resources :favourites, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
