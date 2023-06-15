Rails.application.routes.draw do
  root "users#new"
  get 'signup', to:'users#new'
  resources :users

  get 'login', to:'sessions#new'
  get 'logout', to:'sessions#destroy'
  resource :sessions, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
