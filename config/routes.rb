Rails.application.routes.draw do
  root to: 'categories#index'

  resources :categories do
    resources :ideas, only: [:index, :new, :create, :edit, :show, :destroy]
  end
  resources :images, only: [:index, :destroy, :new, :create]
  resources :ideas, only: [:index]
end
