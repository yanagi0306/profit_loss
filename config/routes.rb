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
  resources :budgets_day_ratios, only: %i[index create]
  resources :achievements, only: [:create]
  resources :incomes, only: %i[index create update]
  resources :sales, only: %i[index create update]
  resources :variable_costs, only: %i[index create update]
end
