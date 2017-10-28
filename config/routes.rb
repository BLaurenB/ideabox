Rails.application.routes.draw do
  root 'welcome#index'

  namespace :admin do
    resources :categories
    resources :images, only: [:index, :destroy, :new, :create]
  end

  resources :ideas, only: [:index, :new, :create, :edit,:update, :show, :destroy]
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
