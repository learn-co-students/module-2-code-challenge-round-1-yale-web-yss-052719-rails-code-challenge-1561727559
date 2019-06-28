Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines

  ## Only "resources :heroines, only: [:index, :show, :new, :create]" is required for this coding challenge.
  ## For the sake of compeletion and active practice, all resources for the heroines model were added.
end
