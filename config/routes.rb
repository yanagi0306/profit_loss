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
  resources :budgets, only: [:index]
  resources :budgets_day_ratios, only: [:index]
  resources :achievements, only: [:index]
  resources :incomes,only: [:index] do
    collection do
      get 'search'
      patch 'updates'
    end
  end
  resources :sales, only: [:index]
  resources :variable_costs, only: [:index]
end
