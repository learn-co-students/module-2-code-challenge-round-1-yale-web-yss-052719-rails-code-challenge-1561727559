Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:show, :create, :new, :index]
end
