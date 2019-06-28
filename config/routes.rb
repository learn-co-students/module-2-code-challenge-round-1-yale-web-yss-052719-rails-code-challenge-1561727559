Rails.application.routes.draw do
  resources :powers, except: :destroy
  resources :heroines
  get '/search', to: "heroines#search"  
end
