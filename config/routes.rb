Rails.application.routes.draw do
  root 'passwords#new'

  resources :passwords, only: :create
end
