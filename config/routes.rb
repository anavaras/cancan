Rails.application.routes.draw do
  resources :pages
  devise_for :users
  get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
end
