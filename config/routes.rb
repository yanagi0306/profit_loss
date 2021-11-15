Rails.application.routes.draw do
  devise_for :stores,
             controllers: {
               registrations: 'stores/registrations',
               sessions: 'stores/sessions',
             }
  devise_for :companies,
             controllers: {
               registrations: 'companies/registrations',
               sessions: 'companies/sessions',
             }
  root to: 'stores#index'

  resources :stores, only: [:index]
  resources :budgets, only: %i[index update create]
end
