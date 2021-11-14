Rails.application.routes.draw do
  devise_for :companies
  devise_for :stores
  root to: 'stores#index'

  resources :stores,only: [:index]
  resources :companies,only: [:index]

end
