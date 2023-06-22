Rails.application.routes.draw do
  root "posts#index"
  get 'signup', to:'users#new'
  resources :users

  get 'login', to:'sessions#new'
  get 'logout', to:'sessions#destroy'
  resource :sessions, only: [:create]

  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
