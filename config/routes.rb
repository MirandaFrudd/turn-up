Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages, only: [:index, :profile]
  resources :favourites, only: [:index, :create, :destroy]
  resources :restaurants, :bars, :activities, only: [:show] do
    resources :reviews 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
