Rails.application.routes.draw do
  resources :categories
  resources :images, only: [:index, :edit, :update, :destroy, :new, :create]
end
