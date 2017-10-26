Rails.application.routes.draw do
  root 'welcome#index'

  resources :categories
  resources :images, only: [:index, :destroy, :new, :create]
  resources :ideas, only: [:index, :new, :edit, :show, :destroy]
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

end
