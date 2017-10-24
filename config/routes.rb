Rails.application.routes.draw do
  resources :categories
  resources :images, only: [:index, :destroy, :new, :create]
  resources :ideas, only: [:index, :new, :edit, :show, :destroy]

end
