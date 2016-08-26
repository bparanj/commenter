Rails.application.routes.draw do
  resources :comments
  resources :users

  root 'comments#index'
end
