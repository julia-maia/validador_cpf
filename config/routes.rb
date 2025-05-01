Rails.application.routes.draw do
  resources :cadastros, only: [:new, :create]
  root "cadastros#new"
end