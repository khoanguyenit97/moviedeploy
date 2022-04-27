Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'movie#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'register', to: 'users#new'
  delete 'logout', to: 'sessions#destroy'
  get 'share', to: 'movie#new'
  post 'share', to: 'movie#create'
end
